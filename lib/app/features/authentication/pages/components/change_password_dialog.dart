import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:heyava_authentication/app/features/authentication/controllers/change_password_controller.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/text_field/password_text_field.dart';
import 'package:heyava_authentication/app/features/authentication/pages/components/toast/error_toast.dart';

class ChangePasswordDialog extends StatelessWidget {
  final ChangePasswordController controller =
      GetIt.I.get<ChangePasswordController>();
  ChangePasswordDialog({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Form(
            key: _formKey,
            child: Observer(builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PasswordTextField(
                      controller: controller.currentPasswordField,
                      validator: (value) {
                        if (value == null ||
                            controller.sessionController.user!.password !=
                                controller.currentPasswordField.text) {
                          return 'Revise sua senha atual';
                        }
                        return null;
                      }),
                  PasswordTextField(
                    controller: controller.newPasswordField,
                    label: 'Nova Senha',
                    validator: _validatorPasswordField,
                  ),
                  PasswordTextField(
                    controller: controller.confirmNewPasswordField,
                    label: 'Confirme sua nova senha',
                    validator: _validatorPasswordField,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.updatePassword();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Salvar'))
                ],
              );
            })),
      ),
    );
  }

  String? _validatorPasswordField(
    value,
  ) {
    if (value == null) {
      return 'Preencha a senha';
    }
    if (controller.confirmNewPasswordField.text !=
        controller.newPasswordField.text) {
      return 'As senhas não coincidem';
    }

    if (value.length < 6) {
      return 'A senha deve possuir pelo menos 6 caracteres';
    }

    return null;
  }
}
