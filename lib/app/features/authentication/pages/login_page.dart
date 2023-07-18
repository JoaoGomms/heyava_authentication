import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/login_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/button/app_elevated_button.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/email_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/password_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/toast/error_toast.dart';

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
        child: Form(
          key: controller.formKey,
          child: Observer(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.error != null && controller.error!.isNotEmpty)
                  ErrorToast(label: controller.error!),
                EmailTextField(
                  controller: controller.emailField,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return 'E-mail inválido, verifique se está faltando algo';
                    }

                    return null;
                  },
                ),
                PasswordTextField(
                  controller: controller.passwordField,
                  validator: (value) {
                    if (value == null) {
                      return 'Preencha a senha';
                    }

                    if (value.length < 6) {
                      return 'A senha deve possuir pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                AppElevatedButton(
                    text: AuthenticationTexts.loginButton,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate())
                        controller.login();
                    }),
                Text(
                  AuthenticationTexts.loginTerms,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
