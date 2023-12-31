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

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  String? error;

  @action
  Future<void> login() async {
    try {
      await db.getUserLogin(emailField.text, passwordField.text).then((user) {
        if (user == null) {
          error = 'Usuário não encontrado, revise seu e-mail e/ou senha';
        }

        if (user != null) {
          sessionController.user = user;
          loginSuccessful();
          emailField.clear();
          passwordField.clear();
          error = null;
        }
      });
    } catch (e) {
      error = 'EXCEPTION Usuário não encontrado, revise seu e-mail e/ou senha';
      print('Couldnt find user --- $e');
    }
  }
}
