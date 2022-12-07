import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/splash/controller/spalsh.controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<SplashController>(SplashController());
  }
}
