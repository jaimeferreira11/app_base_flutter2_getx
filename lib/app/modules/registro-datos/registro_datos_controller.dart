import 'dart:developer';
import 'dart:io';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../global_widgets/yes_no_dialog.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigator.dart';
import 'local_widgets/step1_view.dart';
import 'local_widgets/step2_view.dart';

class RegistroDatosController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();

  RxBool buscando = false.obs;

  List<CoolStep> steps = [];
  var form1Key = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  String doc = "";
  String nombre = '';
  String apellido = '';
  String celular = '';
  String correo = '';

  List<File> adjuntos = [];

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    steps.add(CoolStep(
        title: "Datos de cliente",
        subtitle: "Complete los datos",
        content: Step1View(),
        validation: () {
          if (!form1Key.currentState!.validate()) {
            return 'Favor, complete los campos';
          }
          return null;
        }));

    steps.add(CoolStep(
        title: "Imagenes",
        subtitle: "Adjunte al menos una imagen.",
        content: const Step2View(),
        validation: () {
          if (adjuntos.isEmpty) {
            return 'Adjuntá al menos una imagen';
          }

          return null;
        }));

    update();
  }

  onNext(int currentStep) async {}

  onComplete() async {
    final dialog = await DialogoSiNo().abrirDialogoSiNo(
        "¿Enviar solicitud?", "Recuerda que debes tener conexión a internet");

    if (dialog == 1) {
      buscando.value = true;
      await Future.delayed(const Duration(seconds: 2));
      buscando.value = false;

      await DialogoSiNo().abrirDialogoSucccess("Datos enviados");
      nav.goToAndClean(AppRoutes.home);
    }
  }

  Future<int> dialogSelectOrigen() async {
    int origen = 0;
    await Get.dialog(AlertDialog(
      title: const Text(
        'Seleccione el origen',
        style: TextStyle(color: Colors.black),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Camara'),
              onTap: () async {
                var status = await Permission.camera.status;
                while (!status.isGranted) {
                  await Permission.storage.request();
                  status = await Permission.camera.status;
                }
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.pop(context);
                  origen = 1;
                  return origen;
                });
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Galeria'),
              onTap: () async {
                var status = await Permission.storage.status;
                while (!status.isGranted) {
                  await Permission.storage.request();
                  status = await Permission.storage.status;
                }

                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.pop(context);
                  origen = 2;
                  return origen;
                });
              },
            ),
            const Divider()
          ]);
        },
      ),
    ));

    return origen;
  }

  adjuntarCI(int origen) async {
    log('origen: $origen');
    if (origen == 1) {
      XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 25);

      if (pickedFile != null) {
        adjuntos.add(File(pickedFile.path));
//        adjuntos = getlastsElments(adjuntos, 2); // limitar los elementos
        update(['adjuntos']);
        return;
      }
    }
    if (origen == 2) {
      // FilePickerResult result = await FilePicker.platform.pickFiles(
      //   type: FileType.image,
      //   allowCompression: true,
      //   allowMultiple: true,
      // );
      final List<XFile>? images =
          await _picker.pickMultiImage(imageQuality: 25);
      if (images != null) {
        images.forEach((e) {
          adjuntos.add(File(e.path));
        });

        // adjuntos = getlastsElments(adjuntos, 2);
        update(['adjuntos']);
        return;
      }
    }
    FocusScope.of(Get.context!).unfocus();
  }

  getlastsElments(List<File> list, int limit) {
    if (list.length <= limit) return list;

    List<File> aux = [];
    for (var i = (limit - 1); i >= 0; i--) {
      aux.add(list.reversed.skip(i).first);
    }
    log('aux: ${aux.length}');
    return aux;
  }

  Future<bool> back() async {
    final dial = await DialogoSiNo()
        .abrirDialogoSiNo('¿Estás seguro?', "Se cancelará el proceso");

    if (dial == 1) {
      nav.back();
      return true;
    }

    return false;
  }
}
