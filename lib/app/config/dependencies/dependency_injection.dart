import 'package:app_base_flutter2_getx/app/data/repositories/local/auth_repository.dart';
import 'package:app_base_flutter2_getx/app/data/repositories/remote/server_api.dart';
import 'package:app_base_flutter2_getx/app/data/repositories/remote/server_repository.dart';
import 'package:app_base_flutter2_getx/app/helpers/notifications/notificacion_service.dart';
import 'package:app_base_flutter2_getx/app/routes/navigator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dio_config.dart';

class DependecyInjection {
  static Future<void> init() async {
    // ---------  Dio
    Get.lazyPut<DioService>(
      () => DioService(),
      fenix: true,
    );
    //  --------- Shared Preferences
    final shared = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(shared);

    // --------- Modulos

    //  --------- --------- profile
    // ProfileDependencies.inject();

    // repositorios
    Get.lazyPut<AuthRepository>(
        () => AuthRepository(Get.find<SharedPreferences>()),
        fenix: true);

    Get.lazyPut<ServerRepository>(() => ServerRepository(), fenix: true);

    // providers
    Get.lazyPut<ServerAPI>(() => ServerAPI(), fenix: true);

    //  Util
    //  --------- Navigation
    Get.put<NavigatorController>(NavigatorController());
    //  --------- Notifications
    Get.put<NotificationService>(NotificationService());
  }
}
