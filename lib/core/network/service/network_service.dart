import 'dart:async';

import 'package:dio/dio.dart';
import 'package:base_project/core/network/service/network_service_error.dart';

class NetworkService {
  final Dio _dio;

  NetworkService({required Dio dioClient}) : _dio = dioClient;

  Future<R> post<R>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    required R Function(dynamic response) converter,
  }) async {
    Response response;
    try {
      response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (ex) {
      throw NetworkServiceError.fromDioException(ex);
    }

    try {
      return converter(response.data);
    } catch (ex) {
      throw NetworkServiceError.fromParsingException(ex);
    }
  }

  Future<R> get<R>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    required R Function(dynamic response) converter,
  }) async {
    Response response;
    try {
      response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (ex) {
      throw NetworkServiceError.fromDioException(ex);
    }

    try {
      return converter(response.data!);
    } catch (ex) {
      throw NetworkServiceError.fromParsingException(ex);
    }
  }

  Future<R> put<R>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    required R Function(dynamic response) converter,
  }) async {
    Response response;
    try {
      response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (ex) {
      throw NetworkServiceError.fromDioException(ex);
    }

    try {
      return converter(response.data!);
    } catch (ex) {
      throw NetworkServiceError.fromParsingException(ex);
    }
  }

  Future<R> delete<R>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required R Function(dynamic response) converter,
  }) async {
    Response response;
    try {
      response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (ex) {
      throw NetworkServiceError.fromDioException(ex);
    }

    try {
      return converter(response.data!);
    } catch (ex) {
      throw NetworkServiceError.fromParsingException(ex);
    }
  }
}
