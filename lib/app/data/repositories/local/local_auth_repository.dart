import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class LocalAuthRepository {
  final LocalAuthentication auth;

  LocalAuthRepository(this.auth);

  Future<bool> canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  Future<List<BiometricType>> availableBiometric() async {
    return await auth.getAvailableBiometrics();
  }

  Future<bool> authenticate({message = 'Autenticate'}) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: message,
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Se requiere autenticación biométrica',
              cancelButton: 'No, gracias',
            ),
            IOSAuthMessages(
              cancelButton: 'No, gracias',
            ),
          ]);

      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        throw Exception('Biometria no configurada');
      } else if (e.code == auth_error.notEnrolled) {
        throw Exception('Biometria no habilitada');
      } else {
        debugPrint('$e');
        throw Exception('Error no controlado en la biomertia');
      }
    }
  }
}
