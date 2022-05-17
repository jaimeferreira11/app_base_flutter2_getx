import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/errors/exceptions.dart';
import '../../../config/errors/failures.dart';
import '../../models/token_model.dart';
import '../../models/usuario_model.dart';
import '../../providers/local/cache.dart';

const cachedToken = "CACHED_TOKEN";
const cachedUser = "CACHED_USER";

class AuthRepository {
  // final _storage = new FlutterSecureStorage();
  final SharedPreferences sharedPreferences;

  AuthRepository(this.sharedPreferences);

  Future<Either<Failure, bool>> deleteAuthToken() async {
    try {
      // await _storage.deleteAll();
      await sharedPreferences.clear();
      return const Right(true);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, TokenModel>> getAuthToken() async {
    try {
      // final jsonString = await _storage.read(key: CACHED_TOKEN);
      final jsonString = sharedPreferences.getString(cachedToken);
      if (jsonString == null) throw CacheException();
      TokenModel result = TokenModel.fromMap(json.decode(jsonString));
      Cache.instance.token = result.accessToken;
      return Right(result);
    } catch (e) {
      log('$e');
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, TokenModel>> setAuthToken(TokenModel model) async {
    try {
/*       await _storage.write(
          key: CACHED_TOKEN, value: json.encode(model.toJson())); */

      await sharedPreferences.setString(
          cachedToken, json.encode(model.toJson()));

      Cache.instance.token = model.accessToken;
      return Right(model);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, UsuarioModel>> getUsuario() async {
    try {
      // final jsonString = await _storage.read(key: CACHED_USER);
      final jsonString = sharedPreferences.getString(cachedUser);
      if (jsonString == null) throw CacheException();

      return Right(UsuarioModel.fromJson(json.decode(jsonString)));
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, UsuarioModel>> setUsuario(UsuarioModel model) async {
    try {
      Cache.instance.user = model;
      final String value = jsonEncode(model.toJson());
      //await _storage.write(key: cachedUser, value: value);
      await sharedPreferences.setString(cachedUser, value);
      return Right(model);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  Future<Either<Failure, bool>> deleteUsuario() async {
    try {
      // await _storage.delete(key: cachedUser);
      await sharedPreferences.remove(cachedUser);
      return const Right(true);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}
