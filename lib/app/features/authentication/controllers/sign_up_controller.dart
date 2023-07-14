import 'dart:math';

import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/models/user_model.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../infrastructure/session_controller.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final SessionController sessionController;

  final DatabaseHelper db;

  late VoidCallback signUpSuccessful;

  _SignUpControllerBase(this.sessionController, this.db);

  setupCallbacks(VoidCallback signUpSuccessful) {
    this.signUpSuccessful = signUpSuccessful;
  }

  @observable
  TextEditingController nameField = TextEditingController();
  @observable
  TextEditingController emailField = TextEditingController();
  @observable
  TextEditingController passwordField = TextEditingController();
  @observable
  TextEditingController confirmPasswordField = TextEditingController();

  @action
  Future<void> signUp() async {
    if (passwordField.text != confirmPasswordField.text) {
      print('Senhas nao coincidem');
      return;
    }

    UserModel user = UserModel(Random().nextDouble(), nameField.text,
        passwordField.text, emailField.text, Random().nextDouble());

    try {
      await db.saveUser(user).then((value) async {
        print('SAVED USER ${user.toMap()}');
        sessionController.user = user;
        signUpSuccessful();
      });
    } catch (e) {
      print('Error: Data save fail $e');
    }
  }
}
