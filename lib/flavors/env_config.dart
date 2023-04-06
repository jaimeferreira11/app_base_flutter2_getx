class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    this.shouldCollectCrashLog = false,
  }) {}
}
