import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:base_project/core/network/service/network_service.dart';
import 'package:base_project/core/network/service/network_service_error.dart';
import 'package:base_project/core/constant/network/network_exception.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio dio;
  late NetworkService service;

  setUp(() {
    dio = MockDio();
    service = NetworkService(dioClient: dio);
  });

  Map<String, dynamic> fakeJson = {"status": 200, "message": "ok"};

  R converter<R>(dynamic json) {
    return json['message'] as R;
  }

  group('post', () {
    test('should return converted response on success', () async {
      when(
        () => dio.post(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/post'),
          data: fakeJson,
          statusCode: 200,
        ),
      );

      final result = await service.post<String>('/post', converter: converter);

      expect(result, 'ok');
    });

    test(
      'should throw NetworkServiceError.fromDioException on DioException',
      () async {
        when(
          () => dio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          ),
        ).thenThrow(
          DioException(
            type: DioExceptionType.connectionTimeout,
            requestOptions: RequestOptions(path: '/post'),
          ),
        );

        expect(
          () => service.post<String>('/post', converter: converter),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.connectionTimeout,
            ),
          ),
        );
      },
    );

    test(
      'should throw NetworkServiceError.fromParsingException on converter error',
      () async {
        when(
          () => dio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/post'),
            data: fakeJson,
            statusCode: 200,
          ),
        );

        expect(
          () => service.post<int>(
            '/post',
            converter: (json) => int.parse(json['message']),
          ),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.serialization,
            ),
          ),
        );
      },
    );
  });

  group('get', () {
    test('should return converted response on success', () async {
      when(
        () => dio.get(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/get'),
          data: fakeJson,
          statusCode: 200,
        ),
      );

      final result = await service.get<String>('/get', converter: converter);

      expect(result, 'ok');
    });

    test(
      'should throw NetworkServiceError.fromDioException on DioException',
      () async {
        when(
          () => dio.get(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          ),
        ).thenThrow(
          DioException(
            type: DioExceptionType.connectionError,
            requestOptions: RequestOptions(path: '/get'),
          ),
        );

        expect(
          () => service.get<String>('/get', converter: converter),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.connectionError,
            ),
          ),
        );
      },
    );

    test(
      'should throw NetworkServiceError.fromParsingException on converter error',
      () async {
        when(
          () => dio.get(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/get'),
            data: fakeJson,
            statusCode: 200,
          ),
        );

        expect(
          () => service.get<int>(
            '/get',
            converter: (json) => int.parse(json['message']),
          ),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.serialization,
            ),
          ),
        );
      },
    );
  });

  group('put', () {
    test('should return converted response on success', () async {
      when(
        () => dio.put(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
          onSendProgress: any(named: 'onSendProgress'),
          onReceiveProgress: any(named: 'onReceiveProgress'),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/put'),
          data: fakeJson,
          statusCode: 200,
        ),
      );

      final result = await service.put<String>('/put', converter: converter);

      expect(result, 'ok');
    });

    test(
      'should throw NetworkServiceError.fromDioException on DioException',
      () async {
        when(
          () => dio.put(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          ),
        ).thenThrow(
          DioException(
            type: DioExceptionType.badCertificate,
            requestOptions: RequestOptions(path: '/put'),
          ),
        );

        expect(
          () => service.put<String>('/put', converter: converter),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.badCertificate,
            ),
          ),
        );
      },
    );

    test(
      'should throw NetworkServiceError.fromParsingException on converter error',
      () async {
        when(
          () => dio.put(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/put'),
            data: fakeJson,
            statusCode: 200,
          ),
        );

        expect(
          () => service.put<int>(
            '/put',
            converter: (json) => int.parse(json['message']),
          ),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.serialization,
            ),
          ),
        );
      },
    );
  });

  group('delete', () {
    test('should return converted response on success', () async {
      when(
        () => dio.delete(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/delete'),
          data: fakeJson,
          statusCode: 200,
        ),
      );

      final result = await service.delete<String>(
        '/delete',
        converter: converter,
      );

      expect(result, 'ok');
    });

    test(
      'should throw NetworkServiceError.fromDioException on DioException',
      () async {
        when(
          () => dio.delete(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenThrow(
          DioException(
            type: DioExceptionType.cancel,
            requestOptions: RequestOptions(path: '/delete'),
          ),
        );

        expect(
          () => service.delete<String>('/delete', converter: converter),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.cancel,
            ),
          ),
        );
      },
    );

    test(
      'should throw NetworkServiceError.fromParsingException on converter error',
      () async {
        when(
          () => dio.delete(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/delete'),
            data: fakeJson,
            statusCode: 200,
          ),
        );

        expect(
          () => service.delete<int>(
            '/delete',
            converter: (json) => int.parse(json['message']),
          ),
          throwsA(
            isA<NetworkServiceError>().having(
              (e) => e.exceptionType,
              'exceptionType',
              NetworkExceptionType.serialization,
            ),
          ),
        );
      },
    );
  });
}
