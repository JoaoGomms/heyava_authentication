import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';

import 'app_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  const EmailTextField(
      {Key? key, required this.controller, required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      validator: validator,
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      inputFormatters: [],
      label: AuthenticationTexts.emailField,
    );
  }
}
