import 'package:dartz/dartz.dart';
import 'package:base_project/core/constant/network/failure.dart';
import 'package:base_project/core/network/response/base_response.dart';
import 'package:base_project/core/network/service/network_service_error.dart';
import 'package:flutter/foundation.dart';

/// A typedef representing a network call result that can either succeed or fail.
///
/// - Returns a [Future] that completes with [Either]<[Failure], [T]>:
///   - [Left]<[Failure]> indicates an error occurred (network, parsing, or API failure).
///   - [Right]<[T]> indicates a successful response with the expected data type [T].
typedef FutureResult<T> = Future<Either<Failure, T>>;

/// Wraps a network call safely, returning either a [Failure] or the expected result [T].
///
/// - [execute]: The async network operation to perform.
/// - [customErrorHandler]: Optional handler for specific [NetworkServiceError] cases.
///
/// Returns a [FutureResult]<[T]> (`Either<Failure, T>`):
/// - [Right] contains successful result.
/// - [Left] contains a [Failure] with an error message.
FutureResult<T> handleRequest<T>({
  required FutureResult<T> Function() execute,
  FutureResult<T> Function(NetworkServiceError e)? customErrorHandler,
}) async {
  try {
    return await execute.call();
  } on NetworkServiceError catch (e) {
    if (customErrorHandler != null) {
      try {
        return await customErrorHandler.call(e);
      } catch (e, stacktrace) {
        if (kDebugMode) {
          debugPrintStack(
            stackTrace: stacktrace,
            label: '${e.runtimeType} - $e',
          );
        }
        return Left(ErrorMessageFailure(e.toString()));
      }
    }

    return defaultNetworkServiceErrorHandler(e);
  } catch (e, stacktrace) {
    if (kDebugMode) {
      debugPrintStack(stackTrace: stacktrace, label: '${e.runtimeType} - $e');
    }
    return Left(ErrorMessageFailure(e.toString()));
  }
}

/// Default handler for [NetworkServiceError].
/// Extracts message from `data` if possible, otherwise returns a generic error.
FutureResult<T> defaultNetworkServiceErrorHandler<T>(
  NetworkServiceError e,
) async {
  if (e.data == null) {
    return Left(
      ErrorMessageFailure(
        e.message ?? "Something went wrong, please try again!",
      ),
    );
  }

  try {
    BaseResponse response;
    try {
      response = BaseResponse.fromJson(e.data, (json) => null);
    } catch (_) {
      throw e;
    }

    return Left(
      ErrorMessageFailure(
        response.message ?? "Something went wrong, please try again!",
      ),
    );
  } catch (e) {
    return Left(ErrorMessageFailure(e.toString()));
  }
}
