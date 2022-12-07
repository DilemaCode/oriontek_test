import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oriontek_flutter/modules/splash/controller/spalsh.controller.dart';
import 'package:oriontek_flutter/themes/fonts.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome',
          style: AppFonts.hugeText2,
        ),
      ),
    );
  }
}
