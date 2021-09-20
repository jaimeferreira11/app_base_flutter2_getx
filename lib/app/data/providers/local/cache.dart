import 'dart:async';

class Cache {
  static Cache? _instance;

  Cache._() {
    // initialization and stuff
  }

  factory Cache() {
    _instance ??= Cache._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }
  static Cache get instance => _instance!;

  late String token;
  // UsuarioModel user;
  late String version;

  // Future<void> setToken(String data) async {
  //   print("Guardando el token en memoria");
  //   this.token = data;
  //   log.d("Token guardado en cache");
  // }

  // Future<void> setUsuario(UsuarioModel data) async {
  //   print("Guardando el usuario en memoria");
  //   this.user = data;
  //   print("usuario saved");
  //   //log.d("Usuario guardado en cache");
  // }
}
