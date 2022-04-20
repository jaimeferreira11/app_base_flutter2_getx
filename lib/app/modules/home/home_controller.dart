import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../global_widgets/cambiar_password_widget.dart';
import '../../helpers/notifications/notificacion_service.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator.dart';
import 'local_widgets/custom_drawer.dart';

class HomeController extends GetxController {
  final nav = Get.find<NavigatorController>();
  final noti = Get.find<NotificationService>();
  final serverRepo = Get.find<ServerRepository>();
  final authRepo = Get.find<AuthRepository>();

// Drawer
  int selectedDrawerIndex = 0;
  String title = "Inicio";
  Widget selectedView = const Text('Inicio');
  final drawerItems = [
    DrawerItem("Inicio", FontAwesomeIcons.home),
    // DrawerItem("Perfil", FontAwesomeIcons.userAlt),
    DrawerItem("Cambiar contraseña", FontAwesomeIcons.userLock),
    // DrawerItem("Sobre esta app", FontAwesomeIcons.copyright),
    DrawerItem("Cerrar sesión", FontAwesomeIcons.signOutAlt)
  ];

  Widget currentPage = Container();
  RxBool buscando = false.obs;

  @override
  void onReady() async {
    super.onReady();

    update();
  }

  onSelectItem(int index) {
    nav.back();

// limoiar pantalla password
    limpiarPantallaPass();
    switch (index) {
      case 0:
        title = "Inicio";
        selectedDrawerIndex = index;
        currentPage = Container();
        update();
        break;
      case 1:
        title = "Cambiar contraseña";
        selectedDrawerIndex = index;
        currentPage = const CambiarPasswordWidget();
        update();
        break;
      case 2:
        launchDialogCerrarSesion();
        break;
      default:
        return const Text("Hola");
    }

    update();
  }

  // cambiar pass
  bool workInProgress = false;

  String? oldPassword;
  String? newPassword;
  String? repeatNewPassword;
  Map<String, TextEditingController> mapControllers = {
    "oldPassword": TextEditingController(),
    "newPassword": TextEditingController(),
    "repeatNewPassword": TextEditingController(),
  };
  Map<String, FocusNode> mapFocusNodes = {
    "oldPassword": FocusNode(),
    "newPassword": FocusNode(),
    "repeatNewPassword": FocusNode()
  };
  bool passwordVisible1 = false,
      passwordVisible2 = false,
      passwordVisible3 = false;
  RxBool ignore = false.obs;
  RxString errorPass = "".obs;

  limpiarPantallaPass() {
    passwordVisible1 = false;
    passwordVisible2 = false;
    passwordVisible3 = false;
    ignore.value = false;
    errorPass.value = "";
    oldPassword = "";
    newPassword = "";
    repeatNewPassword = "";
    mapControllers["oldPassword"]!.clear();
    mapControllers["newPassword"]!.clear();
    mapControllers["repeatNewPassword"]!.clear();
    update(['changePass']);
  }

  cambiarPass() async {
    if (newPassword == null ||
        repeatNewPassword == null ||
        oldPassword == null) {
      errorPass.value = "Completa los campos";
      return;
    }

    if (newPassword != repeatNewPassword) {
      errorPass.value = "Las nuevas contraseñas no coinciden";
      return;
    } else if (newPassword!.length < 7 || oldPassword!.length < 7) {
      errorPass.value = "Las contrasen1as deben tener al menos 7 caracteres";
      return;
    } else {
      errorPass.value = "";
    }
    ignore.value = true;

    // final resp = await serverRepo.cambiarPassword(oldPassword!, newPassword!);

    // ignore.value = false;
    // resp.fold((l) {
    //   if (l is CacheFailure) {
    //     errorPass.value = l.mensaje;
    //   } else {
    //     noti.mostrarInternalError(
    //         mensaje: l.mensaje, position: SnackPosition.BOTTOM);
    //   }
    // }, (r) async {
    //   errorPass.value = "";
    //   limpiarPantallaPass();
    //   noti.mostrarSnackBar(
    //       color: NotiKey.success,
    //       mensaje: "Contrasen1a actualizada correctamente",
    //       titulo: "Actualizado");
    // });
  }

  // Cerrar sesion
  Future<void> launchDialogCerrarSesion() async {
    Get.dialog(
        const AlertDialog(
          content: Text("Cerrando sesión...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.black)),
        ),
        barrierDismissible: false);
    await cerrarSesion();
  }

  Future<void> cerrarSesion() async {
    // await serverRepo.logout();
    // await authRepo.deleteAuthToken();
    // await authRepo.deleteUsuario();

    Future.delayed(const Duration(milliseconds: 500), () {
      nav.back();
      nav.goToAndClean(AppRoutes.login);
    });
  }
}
