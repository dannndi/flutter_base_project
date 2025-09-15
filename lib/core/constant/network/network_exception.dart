// coverage:ignore-line
enum NetworkExceptionType {
  /// unauthorize
  unauthorize,

  /// Caused by a connection timeout.
  connectionTimeout,

  /// It occurs when url is sent timeout.
  sendTimeout,

  /// It occurs when receiving timeout.
  receiveTimeout,

  /// Caused by an incorrect certificate as configured by [ValidateCertificate].
  badCertificate,

  /// caused by an incorrect status code as configured by
  badResponse,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  /// Caused for example by a `xhr.onError` or SocketExceptions.
  connectionError,

  /// unknown error
  unknown,

  /// parsing response
  serialization,
}
