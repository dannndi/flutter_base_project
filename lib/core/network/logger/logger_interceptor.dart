import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: false,
      printEmojis: false,
    ),
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final httpMethod = options.method.toUpperCase();
    final url = options.baseUrl + options.path;

    logger.i('Request → [$httpMethod] $url');
    logger.d({
      'Headers': options.headers,
      'Query Params': options.queryParameters,
      'Request Body': options.data is FormData
          ? (options.data as FormData).fields.asMap().map((i, m) {
              return m;
            })
          : options.data,
    });

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    logger.i(
      'Response ← [${response.statusCode}] ${response.requestOptions.uri}',
    );
    logger.d({
      'Response Output': response.data,
    });

    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final httpMethod = err.requestOptions.method.toUpperCase();
    final url = err.requestOptions.baseUrl + err.requestOptions.path;

    logger.e('Error → [$httpMethod] $url');

    if (err.response != null) {
      logger.e({
        'Status Code': err.response?.statusCode,
        'Error Data': err.response?.data,
      });
    } else if (err.error is SocketException) {
      logger.e('No Internet Connectivity');
    } else {
      logger.e('Unknown Error');
    }

    return super.onError(err, handler);
  }
}
