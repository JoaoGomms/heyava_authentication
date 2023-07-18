import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/authentication/models/user_model.dart';
part 'session_controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {
  final SharedPreferences sp;

  @observable
  UserModel? user;

  @observable
  bool isOnboardingCompleted = false;

  _SessionControllerBase(this.sp);

  setupReactions() {
    reaction((p0) => user, (p0) {
      if (user == null) {
        sp.remove('user');
        return;
      }

      sp.setString('user', jsonEncode(user!.toMap()));
    });
    reaction((p0) => isOnboardingCompleted, (p0) {
      sp.setBool('isOnboardingCompleted', isOnboardingCompleted);
    });
  }

  getInitialData() {
    var localUserData = sp.getString('user') ?? '';

    if (localUserData.isNotEmpty) {
      UserModel user = UserModel.fromMap(jsonDecode(localUserData));

      this.user = UserModel(
          user.id, user.name, user.password, user.email, user.addressId);
    }

    var localIsOnboardingCompleted =
        sp.getBool('isOnboardingCompleted') ?? false;

    isOnboardingCompleted = localIsOnboardingCompleted;
  }

  logout() {
    user = null;
  }
}
