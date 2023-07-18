// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordController on _ChangePasswordControllerBase, Store {
  late final _$currentPasswordFieldAtom = Atom(
      name: '_ChangePasswordControllerBase.currentPasswordField',
      context: context);

  @override
  TextEditingController get currentPasswordField {
    _$currentPasswordFieldAtom.reportRead();
    return super.currentPasswordField;
  }

  @override
  set currentPasswordField(TextEditingController value) {
    _$currentPasswordFieldAtom.reportWrite(value, super.currentPasswordField,
        () {
      super.currentPasswordField = value;
    });
  }

  late final _$newPasswordFieldAtom = Atom(
      name: '_ChangePasswordControllerBase.newPasswordField', context: context);

  @override
  TextEditingController get newPasswordField {
    _$newPasswordFieldAtom.reportRead();
    return super.newPasswordField;
  }

  @override
  set newPasswordField(TextEditingController value) {
    _$newPasswordFieldAtom.reportWrite(value, super.newPasswordField, () {
      super.newPasswordField = value;
    });
  }

  late final _$confirmNewPasswordFieldAtom = Atom(
      name: '_ChangePasswordControllerBase.confirmNewPasswordField',
      context: context);

  @override
  TextEditingController get confirmNewPasswordField {
    _$confirmNewPasswordFieldAtom.reportRead();
    return super.confirmNewPasswordField;
  }

  @override
  set confirmNewPasswordField(TextEditingController value) {
    _$confirmNewPasswordFieldAtom
        .reportWrite(value, super.confirmNewPasswordField, () {
      super.confirmNewPasswordField = value;
    });
  }

  late final _$passwordWasChangedAtom = Atom(
      name: '_ChangePasswordControllerBase.passwordWasChanged',
      context: context);

  @override
  bool get passwordWasChanged {
    _$passwordWasChangedAtom.reportRead();
    return super.passwordWasChanged;
  }

  @override
  set passwordWasChanged(bool value) {
    _$passwordWasChangedAtom.reportWrite(value, super.passwordWasChanged, () {
      super.passwordWasChanged = value;
    });
  }

  late final _$updatePasswordAsyncAction = AsyncAction(
      '_ChangePasswordControllerBase.updatePassword',
      context: context);

  @override
  Future<void> updatePassword() {
    return _$updatePasswordAsyncAction.run(() => super.updatePassword());
  }

  @override
  String toString() {
    return '''
currentPasswordField: ${currentPasswordField},
newPasswordField: ${newPasswordField},
confirmNewPasswordField: ${confirmNewPasswordField},
passwordWasChanged: ${passwordWasChanged}
    ''';
  }
}
