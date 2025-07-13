import 'package:dio/dio.dart';
import 'package:base_project/core/network/interceptor/app_interceptor.dart';
import 'package:base_project/core/network/logger/logger_interceptor.dart';
import 'package:flutter/foundation.dart';

extension HttpClient on Dio {
  void init(String baseUrl) {
    options.baseUrl = baseUrl;
    options.connectTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
    options.sendTimeout = const Duration(seconds: 1800);
    interceptors.add(AppInterceptor());
    if (kDebugMode) {
      interceptors.add(LoggerInterceptor());
    }
  }
}
