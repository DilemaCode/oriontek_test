import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/clients/controller/client.controller.dart';

class ClientsBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<ClientsController>(ClientsController());
  }
}
