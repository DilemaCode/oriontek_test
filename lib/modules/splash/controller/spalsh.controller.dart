import 'package:get/get.dart';
import 'package:oriontek_flutter/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Get.offAndToNamed(AppRoutes.Clients);
    });
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
