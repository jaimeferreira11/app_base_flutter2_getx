import 'package:location/location.dart';

class Cache {
  static Cache? _instance;

  Cache._();

  static Cache get instance => _instance ??= Cache._();

  String? token;
  // late Usuario user;

  LocationData? currentLocation;
  late String version;
}
