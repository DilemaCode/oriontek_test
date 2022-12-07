import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/clients/data/models/client.model.dart';
import 'package:oriontek_flutter/modules/clients/data/repository/client.repo.dart';
import 'package:oriontek_flutter/routes/app_routes.dart';

enum Status {
  init,
  loading,
  loaded,
  error,
}

class ClientsController extends GetxController {
  static ClientsController instance = Get.find();
  RxList<ClientModel> clients = RxList<ClientModel>([]);

  Rx<Status> status = Status.init.obs;

  TextEditingController inputNameCon = TextEditingController();
  TextEditingController inputDescriptionCon = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getClients();
  }

  Future getClients() async {
    status.value = Status.loading;
    await Future.delayed(const Duration(seconds: 2));
    List<ClientModel> _clients = await ClientsRepository().getClients();
    if (_clients.isNotEmpty) {
      clients.value = _clients;
    }
    status.value = Status.loaded;
  }

  Future addClient() async {
    ClientModel client = ClientModel(
      clientId: clients.length.toString() +
          DateTime.now().microsecondsSinceEpoch.toString(),
      name: inputNameCon.text,
      description: inputDescriptionCon.text,
      addresses: [],
    );
    await ClientsRepository().addClient(client.toJson());
    clients.add(client);

    Get.toNamed(AppRoutes.ClientDetail, arguments: client);

    inputNameCon.clear();
    inputDescriptionCon.clear();
  }

  Future deleteClient(ClientModel clientModel) async {
    await ClientsRepository().deleteCliennt(clientModel.toJson());
    clients.removeWhere((element) => element.clientId == clientModel.clientId);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
