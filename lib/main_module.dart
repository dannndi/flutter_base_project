import 'package:base_project/core/env/env.dart';
import 'package:base_project/core/localstorage/local_storage.dart';
import 'package:base_project/core/localstorage/local_storage_secure.dart';
import 'package:base_project/core/network/http_client.dart';
import 'package:base_project/core/network/service/network_service.dart';
import 'package:base_project/core/utils/app_event/app_event_broadcaster.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class MainModule {
  const MainModule._();

  static Future<void> init() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // network
    GetIt.instance.registerSingleton(
      NetworkService(dioClient: Dio()..init(Env.baseUrl)),
    );

    // local storage
    GetIt.instance.registerSingleton<LocalStorage>(
      LocalStorageSecure()..init(),
    );

    // app event
    GetIt.instance.registerSingleton(AppEventBroadcaster());
  }
}
