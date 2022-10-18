import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class Utils {
  static Future<bool> checkConnection(bool toast) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    if (!toast) return false;

    Get.snackbar(
      "Atención", // title
      "No tienes conexión a internet", // message
      icon: Icon(
        Icons.warning,
        color: Colors.red.shade600,
      ),
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      backgroundColor: Colors.black38,
      duration: const Duration(seconds: 3),
    );
    return false;
  }

  static getFileName(String path) {
    return basename(path);
  }

  String capitalize(String text) {
    return "${text.substring(0, 1).toUpperCase()}${text.toLowerCase().substring(1)}";
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
