import 'dart:convert';

import 'request_provider.dart';
import 'utils/enum.dart';
import 'package:dio/dio.dart';

class RequestApiProvider implements RequestProvider, InterceptorsWrapper {
  final Dio dio = Dio();
  String? dataName = '';

  RequestApiProvider() {
    dio.options.connectTimeout = Timeout.connectTimeout;
    dio.options.receiveTimeout = Timeout.receiveTimeout;
    dio.interceptors.add(this);
  }
  @override
  void setDataName(String name) => dataName = name;

  @override
  Future<T> deleteAsync<T>(String url, T objeto,
      T Function(Map<String, dynamic> json) fromJson) async {
    var response = await dio.delete(url);
    if (response.data != null) {
      return fromJson(response.data) ?? response.data as T;
    } else {
      return response.data;
    }
  }

  @override
  Future<T> getAsync<T>(String url,
      Function(Map<String, dynamic> json, String? dataName) fromJson) async {
    var response;
    try {
      response = await dio.get(
        url,
      );
    } on DioError catch (error) {
      response = error.response;
      return fromJson(response.data, null);
    }
    if (response.data != null) {
      return fromJson(response.data, dataName) ?? response.data as T;
    } else {
      return response.data;
    }
  }

  @override
  Future<T> postAsync<T>(String url, T objeto,
      T Function(Map<String, dynamic> json) fromJson) async {
    var str = json.encode(objeto);
    var response;
    try {
      response = await dio.post(url, data: str);
    } catch (e) {
      print(e);
    }
    if (response.data != null) {
      return fromJson(response.data) ?? response.data as T;
    } else {
      return response.data;
    }
  }

  @override
  Future<T> putAsync<T>(String url, T objeto,
      T Function(Map<String, dynamic> json) fromJson) async {
    var str = json.encode(objeto);
    var response;
    try {
      response = await dio.put(url, data: str);
    } catch (e) {
      print(e);
    }
    if (response.data != null) {
      return fromJson(response.data) ?? response.data as T;
    } else {
      return response;
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.message);
    print(err.response);
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.realUri);
    print('----------------------');
    print(response.statusCode);
    print('----------------------');
    print(response.data);
    handler.next(response);
  }
}
