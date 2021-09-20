import 'dart:convert';
import 'dart:io';

import 'package:app_base_flutter2_getx/app/data/providers/local/cache.dart';
import 'package:dio/dio.dart';

import 'constants.dart';

class DioService {
  static Dio _dio = new Dio();

  static DioService _singletonHttp = DioService._internal();
  late Dio _http;

  factory DioService() {
    // if (_singletonHttp == null)
    _singletonHttp = DioService._internal();
    return _singletonHttp;
  }

  DioService._internal() {
    init();
  }

  init() {
    _http = Dio();

    _http.options.baseUrl = AppConstants.API_URL;

    _http.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      final path = options.path;
      print(path);

      if (path.contains('oauth/token')) {
        final encode = base64.encode(
          utf8.encode(AppConstants.CLIENT_SECRET),
        );
        options.headers = {
          'Authorization': 'Basic $encode',
          'Content-type': 'application/x-www-form-urlencoded'
        };
      } else if (path.contains("public")) {
        //
        print('Metodo publico');
      } else {
        print('No soy AUTH . Soy $path token: ${Cache.instance.token}');
        options.headers = {
          'Authorization': 'Bearer ${Cache.instance.token}',
          'Content-type': 'application/x-www-form-urlencoded'
        };
        options.contentType = Headers.jsonContentType;
        options.responseType = ResponseType.json;
      }

      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error

      // if (e.response!.statusCode == 500) {
      //   final data = ErrorResponse.fromJson(e.response.toString());
      //   NotificationsService.showSnackbarError(data.msg);
      // } else if (e.response!.statusCode == 404) {
      // } else if (e.response!.statusCode == 400) {
      //   try {
      //     final data = ErrorValidationResponse.fromJson(e.response.toString());
      //     NotificationsService.showSnackbar(
      //         "${data.errors.first.param}: ${data.errors.first.msg}");
      //   } catch (ex) {
      //     print(ex);
      //     NotificationsService.showSnackbar(e.response.toString());
      //   }
      // } else {
      //   final data = ErrorResponse.fromJson(e.response.toString());
      //   NotificationsService.showSnackbar(data.msg);
      // }
      return handler.resolve(e.response!); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
  }

  Dio get client => _http;

  dispose() {
    _http.close();
  }
}
