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
  ObservableList<AddressModel> addressList = ObservableList();

  @observable
  TextEditingController cepField = TextEditingController();
  @observable
  TextEditingController streetField = TextEditingController();
  @observable
  TextEditingController complementdField = TextEditingController();
  @observable
  TextEditingController neighbourhoodField = TextEditingController();
  @observable
  TextEditingController localField = TextEditingController();
  @observable
  TextEditingController stateField = TextEditingController();

  Future<void> saveAddress() async {
    AddressModel address = AddressModel(
        sessionController.user!.addressId,
        cepField.text,
        streetField.text,
        complementdField.text,
        neighbourhoodField.text,
        localField.text,
        stateField.text);

    try {
      db.saveAddress(address);
      addressList.add(address);
    } catch (e) {
      print('Error to save Address --- $e');
    }
  }

  fetchAddressList() async {
    var result = await db.getAddressList(sessionController.user!.addressId);
    addressList.addAll(result);
  }
}
