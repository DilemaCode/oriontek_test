import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/client_detail/data/models/client.detail.model.dart';
import 'package:oriontek_flutter/modules/clients/data/models/client.model.dart';
import 'package:oriontek_flutter/modules/clients/data/repository/client.repo.dart';

class ClientDetailController extends GetxController {
  static ClientDetailController instance = Get.find();

  Rx<ClientModel> client = ClientModel().obs;

  RxList<ClientAddressModel> addresses = RxList<ClientAddressModel>([]);

  TextEditingController inputAddressCon = TextEditingController();
  TextEditingController inputCityCon = TextEditingController();
  TextEditingController inputCountryCon = TextEditingController();
  TextEditingController inputZipCodeCon = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    client.value = Get.arguments;
    client.value.addresses ??= [];
    addresses.value = client.value.addresses ?? [];
  }

  Future addAddress() async {
    ClientModel _client = client.value;
    ClientAddressModel address = ClientAddressModel(
      address: inputAddressCon.text,
      city: inputCityCon.text,
      country: inputCountryCon.text,
      zipCode: inputZipCodeCon.text,
      createdAt:DateTime.now().microsecondsSinceEpoch.toString(),
    );
    addresses.add(address);
    _client.addresses = addresses.value;

    await ClientsRepository().updateClientAddress(_client.toJson());

    inputAddressCon.clear();
    inputCityCon.clear();
    inputCountryCon.clear();
    inputZipCodeCon.clear();
  }

  Future deleteAddress(ClientAddressModel address) async {
    addresses.removeWhere((a) => a.createdAt == address.createdAt);
    client.value.addresses = addresses.value;
    await ClientsRepository().updateClientAddress(client.toJson());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
