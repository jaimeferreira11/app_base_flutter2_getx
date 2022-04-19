import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

    // Get.lazyPut(() => MenuHomeController(), fenix: true);

    // Get.lazyPut(() => NotificationController(), fenix: true);

    // Get.lazyPut(() => AboutController(), fenix: true);
  }
}
