import 'package:base_project/core/utils/app_utils.dart';
import 'data/datasources/{{name.snakeCase()}}_local_datasource.dart';
import 'data/datasources/{{name.snakeCase()}}_remote_datasource.dart';

class {{name.pascalCase()}}Module {
  {{name.pascalCase()}}Module._();

  static Future<void> init() async {}
}
