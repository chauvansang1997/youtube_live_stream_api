

import 'package:flutter/cupertino.dart';

abstract class ApiClient {
  void setToken({@required String token});
  Future<void> setup();
  Future<T> httpGet<T>(String path, {Map<String, dynamic> parameters});

  Future<T> httpPost<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> parameters,
  });

  Future<T> httpPut<T>(String path, {Map<String, dynamic> parameters, dynamic data});

  Future<T> httpDelete<T>(String path, {dynamic data, Map<String, dynamic> parameters});
}



