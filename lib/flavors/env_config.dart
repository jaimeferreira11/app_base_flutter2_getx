import 'enviroment.dart';

class EnvConfig {
  final Environment environment;
  final String appName;
  final String baseUrl;
  final String vPosUrl;
  final bool shouldCollectCrashLog;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.vPosUrl,
    required this.environment,
    this.shouldCollectCrashLog = false,
  });
}
