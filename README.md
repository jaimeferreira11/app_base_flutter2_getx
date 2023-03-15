# app_base_flutter2_getx

A new Flutter project.

## Getting Started

- Cambiar nombre del paquete
  ```
  flutter pub run change_app_package_name:main com.new.package.name
  ```
- Cambiar nombre de la app
  ```
  flutter pub run rename_app:main all="My App Name"
  ```
- Cambiar el launch icon (reemplazar assets/images/ic_launcher.jpg con el nuevo icono) tluego corra el comando

  ```
  flutter pub run flutter_launcher_icons:main
  ```

- FCM: firebase ha agregado recientemente (agregar aplicación flutter) a su base de fuego, lo que hará que agregar nuestra aplicación flutter (android / ios) a firebase solo tome 2 pasos 🔥 pero primero debe descargar [Firebase CLI](https://firebase.google.com/docs/cli?authuser=0&hl=en#install_the_firebase_cli) y en la terminal ejecutar:

  ```
  dart pub global activate flutterfire_cli
  ```

  luego siga el guid de base de fuego y obtendrá un comando similar a este

  ```
  flutterfire configure --project=flutter-firebase-YOUR_PROJECT_ID
  ```

  ¡y eso es! su proyecto ahora está conectado a firebase y fcm está activo y listo para recibir notificaciones
