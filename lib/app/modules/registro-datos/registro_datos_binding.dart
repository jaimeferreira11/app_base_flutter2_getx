import 'package:get/get.dart';

import 'registro_datos_controller.dart';

class RegistroDatosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistroDatosController());
  }
}
