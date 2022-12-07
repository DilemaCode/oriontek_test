import 'package:get/get.dart';
import 'package:oriontek_flutter/modules/client_detail/controller/client.detail.binding.dart';
import 'package:oriontek_flutter/modules/client_detail/pages/client.addaddress.page.dart';
import 'package:oriontek_flutter/modules/client_detail/pages/client.detail.page.dart';
import 'package:oriontek_flutter/modules/clients/controller/client.binding.dart';
import 'package:oriontek_flutter/modules/clients/pages/add.client.page.dart';
import 'package:oriontek_flutter/modules/clients/pages/client.page.dart';
import 'package:oriontek_flutter/modules/splash/controller/spalsh.binding.dart';
import 'package:oriontek_flutter/modules/splash/pages/splash.page.dart';
import 'package:oriontek_flutter/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.ROOT,
      binding: SplashBinding(),
      page: () => const SplashPage(),
      transition: Transition.topLevel,
      popGesture: true,
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.Clients,
      binding: ClientsBinding(),
      page: () => const ClientsPage(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: AppRoutes.ClientDetail,
      binding: ClientDetailBinding(),
      page: () => const ClientDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.ClientAddAddress,
      page: () => const ClientAddAddressPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.AddClient,
      page: () => const AddClientPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
