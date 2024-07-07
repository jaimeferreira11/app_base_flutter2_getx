import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/config/dependencies/dependency_injection.dart';
import 'app/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';

Future<void> mainCommon({required EnvConfig env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.init();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  BuildConfig.instantiate(
    envType: env.environment,
    envConfig: env,
  );

  if (!kIsWeb) {
    // inti fcm services
    // await FcmHelper.initFcm();
    // initialize local notifications service
    // await AwesomeNotificationsHelper.init();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}
