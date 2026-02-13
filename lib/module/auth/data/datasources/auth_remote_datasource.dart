import 'package:base_project/core/network/service/network_service.dart';

abstract class AuthRemoteDataSource {}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final NetworkService _service;

  AuthRemoteDataSourceImpl(this._service);
}
