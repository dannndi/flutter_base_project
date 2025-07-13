import 'package:dartz/dartz.dart';
import 'package:base_project/core/constant/network/failure.dart';
import 'package:base_project/core/network/response/base_response.dart';
import 'package:base_project/core/network/service/network_service_error.dart';
import 'package:flutter/foundation.dart';

Future<Either<Failure, ENTITY>> apiTryCatch<ENTITY>({
  required Future<Either<Failure, ENTITY>> Function() execute,
  Future<Either<Failure, ENTITY>> Function(NetworkServiceError e)?
  customErrorHandler,
}) async {
  try {
    return await execute.call();
  } on NetworkServiceError catch (e) {
    if (customErrorHandler != null) {
      try {
        return await customErrorHandler.call(e);
      } catch (e, stacktrace) {
        debugPrintStack(stackTrace: stacktrace, label: '${e.runtimeType} - $e');
        return Left(ErrorMessageFailure(e.toString()));
      }
    }

    return defaultNetworkServiceErrorHandler(e);
  } catch (e, stacktrace) {
    debugPrintStack(stackTrace: stacktrace, label: '${e.runtimeType} - $e');
    return Left(ErrorMessageFailure(e.toString()));
  }
}

Future<Either<Failure, ENTITY>> defaultNetworkServiceErrorHandler<ENTITY>(
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
