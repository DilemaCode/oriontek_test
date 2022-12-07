import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/client_detail/controller/client.detail.controller.dart';
class ClientDetailBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<ClientDetailController>(ClientDetailController());
  }
}
