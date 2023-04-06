import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_page.dart';
import 'routes/app_pages.dart';
import 'theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      debugShowCheckedModeBanner: false,
      // idioma
      locale: Get.deviceLocale,
      //  supportedLocales: _getSupportedLocal(),
      theme: buildThemeData(),
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPage.pages,
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('es', ''),
    ];
  }
}
