import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/change_password_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/password_text_field.dart';

class ChangePasswordDialog extends StatelessWidget {
  final ChangePasswordController controller =
      GetIt.I.get<ChangePasswordController>();
  ChangePasswordDialog({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PasswordTextField(
                controller: controller.currentPasswordField,
              ),
              PasswordTextField(
                controller: controller.newPasswordField,
              ),
              PasswordTextField(
                controller: controller.confirmNewPasswordField,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.updatePassword();
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Salvar'))
            ],
          )),
    );
  }
}
