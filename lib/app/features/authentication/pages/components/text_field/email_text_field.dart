import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/assets/texts/authentication_texts.dart';

import 'app_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      label: AuthenticationTexts.emailField,
    );
  }
}
