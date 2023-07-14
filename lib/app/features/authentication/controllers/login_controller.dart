import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../infrastructure/database_helper.dart';
import '../../../infrastructure/session_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final SessionController sessionController;

  final DatabaseHelper db;

  late VoidCallback loginSuccessful;

  _LoginControllerBase(this.sessionController, this.db);

  setupCallbacks(VoidCallback loginSuccessful) {
    this.loginSuccessful = loginSuccessful;
  }

  @observable
  TextEditingController emailField = TextEditingController();
  @observable
  TextEditingController passwordField = TextEditingController();

  @action
  Future<void> login() async {
    if (passwordField.text.isEmpty) {
      print('Senha Vazia');
      return;
    }

    if (emailField.text.isEmpty) {
      print('Email Vazia');
      return;
    }

    try {
      await db.getUserLogin(emailField.text, passwordField.text).then((user) {
        if (user != null) {
          sessionController.user = user;
          loginSuccessful();
        }
      });
    } catch (e) {
      print('Couldnt find user --- $e');
    }
  }
}
