// coverage:ignore-file
import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String? message;

  const Failure([this.message = 'Something went wrong, please try again!']);

  @override
  String toString() => message ?? "Something went wrong, please try again!";
}

class ErrorMessageFailure extends Failure {
  const ErrorMessageFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure(super.message);

  @override
  List<Object?> get props => [message];
}
