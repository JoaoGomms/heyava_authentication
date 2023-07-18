import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/models/user_model.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';
import 'package:mobx/mobx.dart';
part 'change_password_controller.g.dart';

class ChangePasswordController = _ChangePasswordControllerBase
    with _$ChangePasswordController;

abstract class _ChangePasswordControllerBase with Store {
  final DatabaseHelper db;

  final SessionController sessionController;

  _ChangePasswordControllerBase(this.db, this.sessionController);

  @observable
  TextEditingController currentPasswordField = TextEditingController();
  @observable
  TextEditingController newPasswordField = TextEditingController();
  @observable
  TextEditingController confirmNewPasswordField = TextEditingController();
  @observable
  bool passwordWasChanged = false;

  @action
  Future<void> updatePassword() async {
    UserModel user = sessionController.user!;

    if (currentPasswordField.text == user.password) {
      var userUpdated = UserModel(user.id, user.name, newPasswordField.text,
          user.email, user.addressId);

      try {
        db.updateUser(userUpdated);
        sessionController.user = userUpdated;

        print('Password Changed');
        passwordWasChanged = true;
        currentPasswordField.clear();
        newPasswordField.clear();
        confirmNewPasswordField.clear();
        Future.delayed(const Duration(seconds: 5)).then((value) {
          passwordWasChanged = false;
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
