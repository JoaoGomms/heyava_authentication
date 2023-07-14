import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController controller = GetIt.I.get<SignUpController>();

  @override
  Widget build(BuildContext context) {
    controller.setupCallbacks(() {
      Navigator.pushReplacementNamed(context, '/account');
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (text) => controller.nameField.text = text,
          ),
          TextField(
            onChanged: (text) => controller.emailField.text = text,
          ),
          TextField(
            onChanged: (text) => controller.passwordField.text = text,
          ),
          TextField(
            onChanged: (text) => controller.confirmPasswordField.text = text,
          ),
          ElevatedButton(
              onPressed: () => controller.signUp(), child: const Text('SALVAR'))
        ],
      ),
    );
  }
}
