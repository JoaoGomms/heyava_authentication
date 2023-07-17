import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';

import 'app_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.visiblePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      validator: (value) {
        if (value == null) {
          return 'Preencha a senha';
        }

        if (value.length < 6) {
          return 'A senha deve possuir pelo menos 6 caracteres';
        }

        return null;
      },
      icon: Icons.lock_outline,
      keyboardType: keyboardType,
      controller: controller,
      label: AuthenticationTexts.passwordField,
      obscureText: true,
    );
  }
}
