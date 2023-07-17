// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressController on _AddressControllerBase, Store {
  late final _$addressListAtom =
      Atom(name: '_AddressControllerBase.addressList', context: context);

  @override
  ObservableList<AddressModel> get addressList {
    _$addressListAtom.reportRead();
    return super.addressList;
  }

  @override
  set addressList(ObservableList<AddressModel> value) {
    _$addressListAtom.reportWrite(value, super.addressList, () {
      super.addressList = value;
    });
  }

  late final _$cepFieldAtom =
      Atom(name: '_AddressControllerBase.cepField', context: context);

  @override
  TextEditingController get cepField {
    _$cepFieldAtom.reportRead();
    return super.cepField;
  }

  @override
  set cepField(TextEditingController value) {
    _$cepFieldAtom.reportWrite(value, super.cepField, () {
      super.cepField = value;
    });
  }

  late final _$streetFieldAtom =
      Atom(name: '_AddressControllerBase.streetField', context: context);

  @override
  TextEditingController get streetField {
    _$streetFieldAtom.reportRead();
    return super.streetField;
  }

  @override
  set streetField(TextEditingController value) {
    _$streetFieldAtom.reportWrite(value, super.streetField, () {
      super.streetField = value;
    });
  }

  late final _$complementFieldAtom =
      Atom(name: '_AddressControllerBase.complementField', context: context);

  @override
  TextEditingController get complementField {
    _$complementFieldAtom.reportRead();
    return super.complementField;
  }

  @override
  set complementField(TextEditingController value) {
    _$complementFieldAtom.reportWrite(value, super.complementField, () {
      super.complementField = value;
    });
  }

  late final _$neighbourhoodFieldAtom =
      Atom(name: '_AddressControllerBase.neighbourhoodField', context: context);

  @override
  TextEditingController get neighbourhoodField {
    _$neighbourhoodFieldAtom.reportRead();
    return super.neighbourhoodField;
  }

  @override
  set neighbourhoodField(TextEditingController value) {
    _$neighbourhoodFieldAtom.reportWrite(value, super.neighbourhoodField, () {
      super.neighbourhoodField = value;
    });
  }

  late final _$localFieldAtom =
      Atom(name: '_AddressControllerBase.localField', context: context);

  @override
  TextEditingController get localField {
    _$localFieldAtom.reportRead();
    return super.localField;
  }

  @override
  set localField(TextEditingController value) {
    _$localFieldAtom.reportWrite(value, super.localField, () {
      super.localField = value;
    });
  }

  late final _$stateFieldAtom =
      Atom(name: '_AddressControllerBase.stateField', context: context);

  @override
  TextEditingController get stateField {
    _$stateFieldAtom.reportRead();
    return super.stateField;
  }

  @override
  set stateField(TextEditingController value) {
    _$stateFieldAtom.reportWrite(value, super.stateField, () {
      super.stateField = value;
    });
  }

  late final _$updateAddressAsyncAction =
      AsyncAction('_AddressControllerBase.updateAddress', context: context);

  @override
  Future<void> updateAddress(num id) {
    return _$updateAddressAsyncAction.run(() => super.updateAddress(id));
  }

  late final _$deleteAddressAsyncAction =
      AsyncAction('_AddressControllerBase.deleteAddress', context: context);

  @override
  Future<void> deleteAddress(num id) {
    return _$deleteAddressAsyncAction.run(() => super.deleteAddress(id));
  }

  late final _$fetchAddressListAsyncAction =
      AsyncAction('_AddressControllerBase.fetchAddressList', context: context);

  @override
  Future<void> fetchAddressList() {
    return _$fetchAddressListAsyncAction.run(() => super.fetchAddressList());
  }

  @override
  String toString() {
    return '''
addressList: ${addressList},
cepField: ${cepField},
streetField: ${streetField},
complementField: ${complementField},
neighbourhoodField: ${neighbourhoodField},
localField: ${localField},
stateField: ${stateField}
    ''';
  }
}
