import 'package:app_base_flutter2_getx/app/modules/splash/splash_binding.dart';
import 'package:app_base_flutter2_getx/app/modules/splash/splash_page.dart';
import 'package:get/route_manager.dart';

import 'app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLAH,
        page: () => const SplashPage(),
        binding: SplashBinding()),
  ];
}
