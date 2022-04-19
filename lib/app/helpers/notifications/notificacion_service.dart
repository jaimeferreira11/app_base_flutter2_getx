import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'notificacion_colors.dart';
import 'notifications_keys.dart';

class NotificationService {
  void mostrarSnackBar(
      {required String color,
      required String mensaje,
      required String titulo,
      SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar('', '',
        snackPosition: position,
        titleText: Text(
          titulo,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          mensaje,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        backgroundColor: coloresSnack[color],
        duration: const Duration(
          milliseconds: 3000,
        ),
        icon: (color == NotiKey.success)
            ? const Icon(FontAwesomeIcons.checkCircle)
            : (color == NotiKey.error)
                ? const Icon(FontAwesomeIcons.timesCircle)
                : (color == NotiKey.info)
                    ? const Icon(FontAwesomeIcons.infoCircle)
                    : (color == NotiKey.warning)
                        ? const Icon(FontAwesomeIcons.exclamationTriangle)
                        : null);
  }

  void mostrarInternalError(
      {required String mensaje, SnackPosition position = SnackPosition.TOP}) {
    Get.snackbar('', '',
        snackPosition: position,
        titleText: const Text(
          "Ocurrio un error interno",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          mensaje,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        backgroundColor: coloresSnack[NotiKey.error],
        duration: const Duration(
          milliseconds: 2500,
        ),
        icon: const Icon(
          FontAwesomeIcons.exclamationCircle,
          color: Colors.white,
        ));
  }

  void mostrarSuccess(
      {String titulo = "Proceso exitoso",
      required String mensaje,
      SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar('', '',
        snackPosition: position,
        titleText: Text(
          titulo,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          mensaje,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        backgroundColor: coloresSnack[NotiKey.success],
        duration: const Duration(
          milliseconds: 2500,
        ),
        icon: const Icon(
          FontAwesomeIcons.checkCircle,
          color: Colors.white,
        ));
  }
}
