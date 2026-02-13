import 'package:base_project/core/env/env.dart';
import 'package:base_project/core/localstorage/local_storage.dart';
import 'package:base_project/core/localstorage/local_storage_secure.dart';
import 'package:base_project/core/network/http_client.dart';
import 'package:base_project/core/network/service/network_service.dart';
import 'package:base_project/core/utils/app_event/app_event_broadcaster.dart';
import 'package:base_project/core/utils/app_utils.dart';
import 'package:base_project/module/auth/auth_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MainModule {
  const MainModule._();

  static Future<void> init() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // network
    di.registerSingleton(
      NetworkService(dioClient: Dio()..init(Env.baseUrl)),
    );

    // local storage
    di.registerSingleton<LocalStorage>(
      LocalStorageSecure()..init(),
    );

    // app event
    di.registerSingleton(AppEventBroadcaster());

    // module
    AuthModule.init();
  }
}
