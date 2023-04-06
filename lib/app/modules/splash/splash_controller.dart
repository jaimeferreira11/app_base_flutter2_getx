import 'package:app_base_flutter2_getx/app/data/repositories/local/auth_repository.dart';
import 'package:app_base_flutter2_getx/app/data/repositories/remote/server_repository.dart';
import 'package:app_base_flutter2_getx/app/routes/app_routes.dart';
import 'package:app_base_flutter2_getx/app/routes/navigator.dart';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/providers/local/cache.dart';
import '../../global_widgets/warning_view.dart';
import '../../helpers/utils.dart';

class SplashController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    final checkIsConnected = await Utils.checkConnection(false);
    if (!checkIsConnected) {
      return Get.offAll(() => WarningView(
            text: 'Su dispositivo no tiene acceso a internet. Favor, verifique su conexión',
            isButtonRequired: true,
            buttonText: 'Aceptar',
            onButtonPressed: () => nav.goToAndClean(AppRoutes.splash),
          ));
    }
    Future.delayed(const Duration(seconds: 2), () => nav.goToOff(AppRoutes.login));
    // final resp = await serverRepo.getVersion();

    // resp.fold((l) => verificarSesion(), (r) async {
    //   final PackageInfo info = await PackageInfo.fromPlatform();

    //   final localVersion = int.parse(info.buildNumber);
    //   print('version en el server: $r');
    //   print('version local: $localVersion');
    //   if (r > localVersion) {
    //     Get.offAll(NewVersionView());
    //     return;
    //   } else {
    //     Cache.instance.version = info.version;
    //     verificarSesion();
    //   }
    // });

    await [
      Permission.location,
      Permission.locationWhenInUse,
      Permission.phone,
      Permission.camera,
      Permission.storage,
    ].request();
    await verifyLocation();

    final PackageInfo info = await PackageInfo.fromPlatform();
    Cache.instance.version = info.version;
  }

  Future verificarSesion() async {
    final respuesta = await authRepo.getAuthToken();

    respuesta.fold(
      (l) => Future.delayed(
        const Duration(seconds: 2),
        () {
          nav.goToOff(AppRoutes.login);
        },
      ),
      (r) => Future.delayed(
        const Duration(seconds: 2),
        () async {
          // final resSession = await serverRepo.verfificarSession();
          // resSession.fold((l) {
          //   authRepo.deleteAuthToken();
          //   authRepo.deleteUsuario();
          //   nav.goToOff(AppRoutes.LOGIN);
          // }, (r) async {
          //   if (r.tipobeneficiario < 100) {
          //     nav.goToOff(AppRoutes.LOGIN);
          //     return;
          //   }
          //   await authRepo.setUsuario(r);

          //   nav.goToAndClean(AppRoutes.HOME);
          // });
        },
      ),
    );
  }

  Future verifyLocation() async {
    final result = await Utils.acquireCurrentLocation();
    if (result != null) {
      Cache.instance.currentLocation = result;
    }
  }
}
