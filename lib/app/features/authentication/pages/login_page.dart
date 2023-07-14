import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = GetIt.I.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    controller.setupCallbacks(() {
      Navigator.of(context).pushReplacementNamed('/account');
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (text) => controller.emailField.text = text,
          ),
          TextField(
            onChanged: (text) => controller.passwordField.text = text,
          ),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              controller.login();
            },
          )
        ],
      ),
    );
  }
}
