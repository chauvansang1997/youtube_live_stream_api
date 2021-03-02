import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:youtube_live_stream_api/youtube_live_stream_api.dart';

class ApiConfig {
  ApiConfig({this.url, this.version, this.log = true});

  String url;
  String version;
  String token;
  bool log;
}

class ApiClientImpl extends ApiClient {
  ApiClientImpl({Dio dio, @required ApiConfig apiConfig}) {
    _dio = dio ?? Dio();
    _config = apiConfig;
    _logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2, errorMethodCount: 8, lineLength: 120, colors: true, printEmojis: true, printTime: false),
    );
  }

  ApiConfig _config;
  Logger _logger;
  Dio _dio;

  @override
  void setToken({@required String token}) {
    _config.token = token;
    _dio.options.headers = {
      'Authorization': 'Bearer ${_config.token}',
      'MobileAppVersion': _config.version,
      "User-Agent": 'Dart'
    };
  }

  Future<void> setup() async {
    _dio.options.baseUrl = _config.url;
    _dio.options.contentType = ContentType.json.toString();
  }

  @override
  Future<T> httpGet<T>(String path, {Map<String, dynamic> parameters}) async {
    try {
      final Response<T> result = await _dio.get<T>(
        path,
        queryParameters: parameters,
      );

      if (_config.log) {
        _logger.i("Http GET=============================>");
        _logger.i(result.data);
        _logger.i("======================================");
      }
      return result.data;
    } catch (e, stack) {
      if (_config.log) {
        _logger.e('', e, stack);
      }
      throw _getException(e);
    }
  }

  @override
  Future<T> httpPost<T>(String path, {dynamic data, Map<String, dynamic> parameters}) async {
    try {
      final Response<T> result = await _dio.post<T>(path, data: data, queryParameters: parameters);
      if (_config.log) {
        _logger.i("Http POST============================>");
        _logger.i(result.data);
        _logger.i("======================================");
      }
      return result.data;
    } catch (e, stack) {
      if (_config.log) {
        _logger.e('', e, stack);
      }
      throw _getException(e);
    }
  }

  @override
  Future<T> httpPut<T>(String path, {Map<String, dynamic> parameters, dynamic data}) async {
    try {
      final Response<dynamic> response = await _dio.put<T>(path, queryParameters: parameters, data: data);
      if (_config.log) {
        _logger.i("Http PUT=============================>");
        _logger.i(response.data);
        _logger.i("======================================");
      }
      return response.data;
    } catch (e, stack) {
      if (_config.log) {
        _logger.e('', e, stack);
      }
      throw _getException(e);
    }
  }

  Future<T> httpDelete<T>(String path, {dynamic data, Map<String, dynamic> parameters}) async {
    try {
      final Response<T> response = await _dio.delete(
        path,
        data: data,
        queryParameters: parameters,
      );
      if (_config.log) {
        _logger.i("Http DELETE==========================>");
        _logger.i(response.data);
        _logger.i("======================================");
      }
      return response.data;
    } catch (e, stack) {
      if (_config.log) {
        _logger.e('', e, stack);
      }
      throw _getException(e);
    }
  }

  Exception _getException(error) {
    if (error is Exception) {
      if (error is DioError) {
        try {
          switch (error.type) {
            case DioErrorType.CONNECT_TIMEOUT:
              return ApiException.requestTimeout();
            case DioErrorType.SEND_TIMEOUT:
              return ApiException.sendTimeout();
            case DioErrorType.RECEIVE_TIMEOUT:
              return ApiException.sendTimeout();
            case DioErrorType.RESPONSE:
              switch (error.response.statusCode) {
                case 400:
                case 401:
                case 403:
                case 404:
                  return YoutubeException.fromJson(error.response.data);
                case 503:
                  return ApiException.serviceUnavailable();
                case 504:
                  return ApiException.gatewayTimeOut();
                default:
                  return ApiException.defaultE('${error.response.statusCode}');
              }

              break;
            case DioErrorType.CANCEL:
              return ApiException.requestCancelled();
              break;
            case DioErrorType.DEFAULT:
              if (error.error is SocketException) {
                return ApiException.socketException(error.error);
              }
              break;

            default:
              return ApiException.defaultE('');
          }
        } catch (e) {
          return ApiException.defaultE('');
        }
      } else if (error is SocketException) {
        return ApiException.socketException(error);
      }
    }

    return ApiException.defaultE('');
  }
}
