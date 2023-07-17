import 'dart:math';

import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/models/address_model.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';
import 'package:mobx/mobx.dart';
part 'address_controller.g.dart';

class AddressController = _AddressControllerBase with _$AddressController;

abstract class _AddressControllerBase with Store {
  final DatabaseHelper db;
  final SessionController sessionController;

  _AddressControllerBase(this.db, this.sessionController);

  @observable
  ObservableList<AddressModel> addressList = ObservableList<AddressModel>();

  @observable
  TextEditingController cepField = TextEditingController();
  @observable
  TextEditingController streetField = TextEditingController();
  @observable
  TextEditingController complementField = TextEditingController();
  @observable
  TextEditingController neighbourhoodField = TextEditingController();
  @observable
  TextEditingController localField = TextEditingController();
  @observable
  TextEditingController stateField = TextEditingController();

  Future<void> saveAddress() async {
    try {
      db.saveAddress(buildAddressObject());
      addressList.add(buildAddressObject());
      addressList = addressList;
    } catch (e) {
      print('Error to save Address --- $e');
    }
  }

  @action
  Future<void> updateAddress(num id) async {
    try {
      db.updateAddress(buildAddressObject(id: id));
      fetchAddressList();
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> deleteAddress(num id) async {
    try {
      db.deleteAddress(id);
      addressList.removeWhere((element) => element.id == id);
      addressList = addressList;
    } catch (e) {
      print(e);
    }
  }

  AddressModel buildAddressObject({num? id}) {
    return AddressModel(
      id ?? Random().nextDouble(),
      cepField.text,
      streetField.text,
      complementField.text,
      neighbourhoodField.text,
      localField.text,
      stateField.text,
      sessionController.user!.addressId,
    );
  }

  @action
  Future<void> fetchAddressList() async {
    var result = await db.getAddressList(sessionController.user!.addressId);
    addressList.clear();
    addressList.addAll(result);
    addressList = addressList;
  }
}
