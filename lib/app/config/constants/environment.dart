import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String key = dotenv.env['KEY'] ?? 'No hay api key';
}
