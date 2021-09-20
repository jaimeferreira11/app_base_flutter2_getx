import 'package:get/get.dart';

class NavigatorController {
  void goToOff(String route) {
    Get.offNamed(route);
  }

  void goToAndClean(String route) {
    Get.offAllNamed(route);
  }

  void goTo(String route) {
    Get.toNamed(route);
  }

  void goToPdf(String route, String pdf) {
    Get.toNamed(route, arguments: {'path': pdf});
  }

  void back() {
    Get.back();
  }
}
