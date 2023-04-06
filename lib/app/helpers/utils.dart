import 'dart:developer';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
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

  static Future<LocationData?> acquireCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    final locationData = await location.getLocation();
    log('La ubicacion actual es : $locationData');
    return locationData.latitude == null ? null : locationData;
  }

  static Future<Uint8List> compressImageUnit8List(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1024,
      minWidth: 1024,
      quality: 90,
    );
    log('List length: ${list.length}');
    log('List lengthInBytes: ${list.lengthInBytes}');
    log('Result length: ${result.length}');
    log('Result lengthInBytes: ${result.lengthInBytes}');

    result.lengthInBytes;

    return result;
  }
}
