import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oriontek_flutter/common/dependency_injection.dart';
import 'package:oriontek_flutter/core/defaults/scroll.config.dart';
import 'package:oriontek_flutter/themes/theme.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    GetMaterialApp(
      title: "OrionTek Clients",
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: suiviTheme,
      scrollBehavior: const ScrollBehaviorModified(),
      defaultTransition: Transition.circularReveal,
    ),
  );
}
