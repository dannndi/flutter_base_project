import 'package:base_project/core/utils/app_utils.dart';
import 'package:base_project/module/auth/data/datasources/auth_local_datasource.dart';
import 'package:base_project/module/auth/data/datasources/auth_remote_datasource.dart';

class AuthModule {
  AuthModule._();

  static Future<void> init() async {
    // data source
    di.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl(di()));
    di.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(di()));
  }
}
