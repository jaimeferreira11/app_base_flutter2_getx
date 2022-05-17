import 'package:get/route_manager.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/registro-datos/registro_datos_binding.dart';
import '../modules/registro-datos/registro_datos_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import 'app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: AppRoutes.registroDatos,
        page: () => const RegistroDatosPage(),
        binding: RegistroDatosBinding()),
  ];
}
