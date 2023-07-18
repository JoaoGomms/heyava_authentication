// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$emailFieldAtom =
      Atom(name: '_LoginControllerBase.emailField', context: context);

  @override
  TextEditingController get emailField {
    _$emailFieldAtom.reportRead();
    return super.emailField;
  }

  @override
  set emailField(TextEditingController value) {
    _$emailFieldAtom.reportWrite(value, super.emailField, () {
      super.emailField = value;
    });
  }

  late final _$passwordFieldAtom =
      Atom(name: '_LoginControllerBase.passwordField', context: context);

  @override
  TextEditingController get passwordField {
    _$passwordFieldAtom.reportRead();
    return super.passwordField;
  }

  @override
  set passwordField(TextEditingController value) {
    _$passwordFieldAtom.reportWrite(value, super.passwordField, () {
      super.passwordField = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_LoginControllerBase.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_LoginControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
emailField: ${emailField},
passwordField: ${passwordField},
formKey: ${formKey},
error: ${error}
    ''';
  }
}
