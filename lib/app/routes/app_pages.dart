import 'package:app_base_flutter2_getx/app/modules/home/home_bindings.dart';
import 'package:app_base_flutter2_getx/app/modules/home/home_page.dart';
import 'package:app_base_flutter2_getx/app/modules/login/login_binding.dart';
import 'package:app_base_flutter2_getx/app/modules/login/login_page.dart';
import 'package:app_base_flutter2_getx/app/modules/splash/splash_binding.dart';
import 'package:app_base_flutter2_getx/app/modules/splash/splash_page.dart';
import 'package:get/route_manager.dart';

import 'app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBindings()),
  ];
}
