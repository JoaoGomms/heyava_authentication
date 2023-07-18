import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heyava_authentication/app/features/authentication/models/address_model.dart';
import 'package:heyava_authentication/app/infrastructure/database_helper.dart';
import 'package:heyava_authentication/app/infrastructure/http_client/viacep/mixin.dart';
import 'package:heyava_authentication/app/infrastructure/session_controller.dart';
import 'package:mobx/mobx.dart';
part 'address_controller.g.dart';

class AddressController = _AddressControllerBase with _$AddressController;

abstract class _AddressControllerBase with Store, CepClient {
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

  @observable
  bool isLoadingAddressFromCep = false;

  void cepReaction() async {
    if (cepField.text.length != 8) {
      return;
    }

    isLoadingAddressFromCep = true;
    var address = await getAddressByCep(cepField.text);
    streetField.text = address.street;
    complementField.text = address.complement;
    neighbourhoodField.text = address.neighbourhood;
    localField.text = address.local;
    stateField.text = address.state;
    isLoadingAddressFromCep = false;
  }

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

  Future<AddressModel> getAddressByCep(String cep) async {
    try {
      Response response = await cepClient.get('/$cep/json');

      if (response.statusCode == HttpStatus.ok) {
        return AddressModel.fromViaCep(response.data);
      }

      throw Exception();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
