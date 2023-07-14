// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpControllerBase, Store {
  late final _$nameFieldAtom =
      Atom(name: '_SignUpControllerBase.nameField', context: context);

  @override
  TextEditingController get nameField {
    _$nameFieldAtom.reportRead();
    return super.nameField;
  }

  @override
  set nameField(TextEditingController value) {
    _$nameFieldAtom.reportWrite(value, super.nameField, () {
      super.nameField = value;
    });
  }

  late final _$termsAtom =
      Atom(name: '_SignUpControllerBase.terms', context: context);

  @override
  bool get terms {
    _$termsAtom.reportRead();
    return super.terms;
  }

  @override
  set terms(bool value) {
    _$termsAtom.reportWrite(value, super.terms, () {
      super.terms = value;
    });
  }

  late final _$emailFieldAtom =
      Atom(name: '_SignUpControllerBase.emailField', context: context);

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
      Atom(name: '_SignUpControllerBase.passwordField', context: context);

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

  late final _$confirmPasswordFieldAtom = Atom(
      name: '_SignUpControllerBase.confirmPasswordField', context: context);

  @override
  TextEditingController get confirmPasswordField {
    _$confirmPasswordFieldAtom.reportRead();
    return super.confirmPasswordField;
  }

  @override
  set confirmPasswordField(TextEditingController value) {
    _$confirmPasswordFieldAtom.reportWrite(value, super.confirmPasswordField,
        () {
      super.confirmPasswordField = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpControllerBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  @override
  String toString() {
    return '''
nameField: ${nameField},
terms: ${terms},
emailField: ${emailField},
passwordField: ${passwordField},
confirmPasswordField: ${confirmPasswordField}
    ''';
  }
}
