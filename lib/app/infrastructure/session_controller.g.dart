// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessionController on _SessionControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_SessionControllerBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isOnboardingCompletedAtom = Atom(
      name: '_SessionControllerBase.isOnboardingCompleted', context: context);

  @override
  bool get isOnboardingCompleted {
    _$isOnboardingCompletedAtom.reportRead();
    return super.isOnboardingCompleted;
  }

  @override
  set isOnboardingCompleted(bool value) {
    _$isOnboardingCompletedAtom.reportWrite(value, super.isOnboardingCompleted,
        () {
      super.isOnboardingCompleted = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
isOnboardingCompleted: ${isOnboardingCompleted}
    ''';
  }
}
