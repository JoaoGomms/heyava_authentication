import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';

import 'app_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.visiblePassword,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      validator: validator,
      icon: Icons.lock_outline,
      keyboardType: keyboardType,
      controller: controller,
      label: AuthenticationTexts.passwordField,
      obscureText: true,
    );
  }
}
