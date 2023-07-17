import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/sign_up_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/button/app_elevated_button.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/app_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/email_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/password_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController controller = GetIt.I.get<SignUpController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.setupCallbacks(() {
      Navigator.pushReplacementNamed(context, '/account');
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailTextField(controller: controller.emailField),
              AppTextField(
                validator: (value) {
                  if (value != null && value.length < 3) {
                    return 'Insira seu nome';
                  }

                  return null;
                },
                controller: controller.nameField,
                icon: Icons.person_outline,
                label: 'Seu nome',
              ),
              PasswordTextField(controller: controller.passwordField),
              PasswordTextField(
                controller: controller.confirmPasswordField,
              ),
              AppElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.signUp();
                    }
                  },
                  text: AuthenticationTexts.singupButton),
              Flexible(
                child: Row(
                  children: [
                    Observer(builder: (context) {
                      return Checkbox(
                        value: controller.terms,
                        onChanged: (value) => controller.terms = value!,
                      );
                    }),
                    Flexible(
                        child: Text(
                      AuthenticationTexts.singupTerms,
                      style: Theme.of(context).textTheme.bodySmall,
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
