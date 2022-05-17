import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../helpers/notifications/notificacion_service.dart';
import '../../helpers/notifications/notifications_keys.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator.dart';

class LoginController extends GetxController {
  final nav = Get.find<NavigatorController>();
  final noti = Get.find<NotificationService>();
  final serverRepo = Get.find<ServerRepository>();
  final authRepo = Get.find<AuthRepository>();

  RxBool ignore = false.obs;
  RxBool ignore2 = false.obs;
  RxBool mostrarPassword = true.obs;

  void cambiarMostrarPassword() =>
      mostrarPassword.value = !mostrarPassword.value;

  final FormGroup loginForm = FormGroup({
    'user': FormControl(
      value: '',
      validators: [
        Validators.required,
      ],
    ),
    'password': FormControl(
      value: '',
      validators: [
        Validators.required,
      ],
    ),
  });

  final FormGroup recuperarPasswordForm = FormGroup({
    'username': FormControl(
      value: '',
      validators: [Validators.required],
    ),
  });

  String get username => loginForm.control('user').value;
  String get password => loginForm.control('password').value;

  late String correo;

  void login() async {
    ignore.value = true;
    FocusScope.of(Get.context!).requestFocus(FocusNode());


    nav.goToAndClean(AppRoutes.home);
    // try {
    //   final result = await serverRepo.login(username, password);

    //   result.fold(
    //     (l) {
    //       ignore.value = false;
    //       noti.mostrarSnackBar(
    //         color: NotiKey.error,
    //         titulo: 'Crendenciales inválidas',
    //         mensaje: "Usuario o contraseña incorrectos",
    //       );
    //       // _obscure.value = true;
    //       //  loginForm.control('user').value = '';
    //       loginForm.control('password').value = '';
    //       loginForm
    //           .control('password')
    //           .setErrors({'Usuario o contraseña incorrectos': true});
    //       loginForm.focus('password');
    //     },
    //     (r) async {
    //       await authRepo.setAuthToken(r);
    //       // await authRepo.setUsuario(r);
    //       nav.goToAndClean(AppRoutes.home);
    //     },
    //   );
    // } catch (e) {
    //   ignore.value = false;
    //   log('$e');
    // }
  }

  

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {}

  recoveryPassword() async {
    ignore.value = true;

    /* final resp = await serverRepo.recuperarClave(correo);
    _ignore.value = false;

    resp.fold((l) => noti.mostrarInternalError(mensaje: "Intente mas tarde"),
        (r) => DialogoSiNo().abrirDialogo("Contraseña restablecida", r)); */
  }
}
