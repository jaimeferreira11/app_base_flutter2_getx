import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/config/dependencies/dependency_injection.dart';
import 'app/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/enviroment.dart';

void main() async {
  //WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.init();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  EnvConfig config = EnvConfig(
    appName: "kirichenko",
    baseUrl: "http://192.168.100.2:8080/api/",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: config,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}
