import 'package:app_base_flutter2_getx/flavors/env_config.dart';

enum Environment { dev, test, prod }

class Environments {
  static EnvConfig get dev => EnvConfig(
      environment: Environment.dev,
      appName: "La Inmobiliaria (Dev)",
      baseUrl: "http://192.168.100.67:8880/rest-api-crecer/", // local
      shouldCollectCrashLog: true,
      vPosUrl: "https://vpos.infonet.com.py:8888/");

  static EnvConfig get test => EnvConfig(
      environment: Environment.test,
      appName: "La Inmobiliaria (Test)",
      baseUrl: "http://201.222.48.66:8880/rest-api-crecer/", // test
      shouldCollectCrashLog: true,
      vPosUrl: "https://vpos.infonet.com.py:8888/");

  static EnvConfig get prod => EnvConfig(
      environment: Environment.prod,
      appName: "La Inmobiliaria",
      baseUrl: "http://app.crecer.com.py:8880/rest-api-crecer/", // produccion
      shouldCollectCrashLog: true,
      vPosUrl: "https://vpos.infonet.com.py:8888/");
}
