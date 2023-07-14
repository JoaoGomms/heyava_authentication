import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/login_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/button/app_elevated_button.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/app_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/email_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/password_text_field.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailTextField(controller: controller.emailField),
            PasswordTextField(controller: controller.passwordField),
            AppElevatedButton(
                text: AuthenticationTexts.loginButton,
                onPressed: () => controller.login()),
            Text(
              AuthenticationTexts.loginTerms,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
