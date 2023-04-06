import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../flavors/build_config.dart';
import '../data/providers/local/cache.dart';
import 'constants.dart';
import 'pretty_dio_logger.dart';

class DioService {
  // static final Dio _dio = Dio();

  static DioService _singletonHttp = DioService._internal();
  late Dio _http;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

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

    _http.options.baseUrl = BuildConfig.instance.config.baseUrl;

    _http.interceptors.add(_prettyDioLogger);

    _http.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      final path = options.path;

      if (path.contains('oauth/token')) {
        final encode = base64.encode(
          utf8.encode(AppConstants.clientSecret),
        );
        options.headers = {'Authorization': 'Basic $encode', 'Content-type': 'application/x-www-form-urlencoded'};
      } else if (path.contains("public")) {
        //
        log('Metodo publico');
      } else {
        log('No soy AUTH . Soy $path token: ${Cache.instance.token}');
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
      //log('Api code error: ${e.response!.statusCode}');
      // log('Desc error: ${e.response!.toString()}');
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
