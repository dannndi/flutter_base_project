import 'package:base_project/core/network/service/network_service_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:base_project/core/constant/network/network_exception.dart';
import 'package:base_project/core/constant/network/failure.dart';

void main() {
  DioException makeDioException({
    required DioExceptionType type,
    int? statusCode,
    dynamic data,
  }) {
    return DioException(
      type: type,
      requestOptions: RequestOptions(path: '/test'),
      response: Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: statusCode,
        data: data,
      ),
    );
  }

  group('NetworkServiceError.fromDioException', () {
    test('should return cancel error when request is cancelled', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.cancel),
      );
      expect(error.exceptionType, NetworkExceptionType.cancel);
      expect(error.message, 'Request cancelled');
    });

    test('should return connectionTimeout error when request times out', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.connectionTimeout),
      );
      expect(error.exceptionType, NetworkExceptionType.connectionTimeout);
      expect(error.message, 'Connection Timeout');
    });

    test('should return sendTimeout error when sending times out', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.sendTimeout),
      );
      expect(error.exceptionType, NetworkExceptionType.sendTimeout);
      expect(error.message, 'Failed to send due to time out');
    });

    test('should return receiveTimeout error when receiving times out', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.receiveTimeout),
      );
      expect(error.exceptionType, NetworkExceptionType.receiveTimeout);
      expect(error.message, 'Failed to receive due to time out');
    });

    test('should return badCertificate error when certificate is invalid', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.badCertificate),
      );
      expect(error.exceptionType, NetworkExceptionType.badCertificate);
      expect(error.message, 'Bad certificate');
    });

    test('should return unauthorize error when response code is 401', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(
          type: DioExceptionType.badResponse,
          statusCode: 401,
          data: {"status": 401, "message": "Unauthorize"},
        ),
      );
      expect(error.exceptionType, NetworkExceptionType.unauthorize);
      expect(error.failure, isA<UnAuthorizedFailure>());
      expect(error.message, 'Unauthorize');
    });

    test(
      'should return badResponse error when response is invalid (non-401)',
      () {
        final error = NetworkServiceError.fromDioException(
          makeDioException(
            type: DioExceptionType.badResponse,
            statusCode: 500,
            data: {"status": 500, "message": "Server error"},
          ),
        );
        expect(error.exceptionType, NetworkExceptionType.badResponse);
        expect(error.message, 'Bad response');
      },
    );

    test('should return connectionError when there is a network issue', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.connectionError),
      );
      expect(error.exceptionType, NetworkExceptionType.connectionError);
      expect(error.message, 'Connection error');
    });

    test('should return unknown error when exception type is unknown', () {
      final error = NetworkServiceError.fromDioException(
        makeDioException(type: DioExceptionType.unknown),
      );
      expect(error.exceptionType, NetworkExceptionType.unknown);
      expect(error.message, 'Unknown error');
    });

    test('should return unknown error when error is not DioException', () {
      final error = NetworkServiceError.fromDioException(Exception('random'));
      expect(error.exceptionType, NetworkExceptionType.unknown);
      expect(error.message, 'Unknown error');
    });
  });

  group('NetworkServiceError.fromParsingException', () {
    test('should return serialization error when parsing fails', () {
      final error = NetworkServiceError.fromParsingException(
        Exception('parse'),
      );
      expect(error.exceptionType, NetworkExceptionType.serialization);
      expect(
        error.message,
        'Failed to parse network response to model or vice versa',
      );
    });
  });

  group('NetworkServiceError equality (Equatable)', () {
    test('should be equal when all props are the same', () {
      final error1 = NetworkServiceError(
        statusCode: 400,
        code: 400,
        message: "Bad request",
        exceptionType: NetworkExceptionType.badResponse,
        data: {"status": 400},
      );

      final error2 = NetworkServiceError(
        statusCode: 400,
        code: 400,
        message: "Bad request",
        exceptionType: NetworkExceptionType.badResponse,
        data: {"status": 400},
      );

      expect(error1, equals(error2));
    });

    test('should not be equal when props differ', () {
      final error1 = NetworkServiceError(
        statusCode: 400,
        code: 400,
        message: "Bad request",
        exceptionType: NetworkExceptionType.badResponse,
        data: {"status": 400},
      );

      final error2 = NetworkServiceError(
        statusCode: 401, // different statusCode
        code: 400,
        message: "Bad request",
        exceptionType: NetworkExceptionType.badResponse,
        data: {"status": 400},
      );

      expect(error1, isNot(equals(error2)));
    });
  });
}
