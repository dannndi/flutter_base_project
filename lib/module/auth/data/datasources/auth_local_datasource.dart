import 'package:base_project/core/local_storage/local_storage.dart';

abstract class AuthLocalDataSource {}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final LocalStorage _localStorage;

  AuthLocalDataSourceImpl(this._localStorage);
}
