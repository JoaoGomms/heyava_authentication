import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/address_controller.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/login_controller.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/sign_up_controller.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerDatabase() async {
  GetIt.I.registerSingleton<DatabaseHelper>(DatabaseHelper());
  GetIt.I.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  await GetIt.I.isReady<SharedPreferences>();
}

void registerControllers() {
  GetIt.I.registerSingleton<SessionController>(SessionController(GetIt.I()));
  getLocalData();

  GetIt.I.registerSingleton<LoginController>(
      LoginController(GetIt.I(), GetIt.I()));
  GetIt.I.registerSingleton<SignUpController>(
      SignUpController(GetIt.I(), GetIt.I()));
  GetIt.I.registerSingleton<AddressController>(
      AddressController(GetIt.I(), GetIt.I()));
}

void getLocalData() {
  var sessionController = GetIt.I.get<SessionController>();
  sessionController.setupReactions();
  sessionController.getInitialData();
}
