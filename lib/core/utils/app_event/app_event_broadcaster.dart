import 'dart:async';

import 'package:base_project/core/utils/app_event/app_event.dart';
import 'package:get_it/get_it.dart';

class AppEventBroadcaster {
  final _controller = StreamController<AppEvent>.broadcast();
  Stream<AppEvent> get _stream => _controller.stream;

  static AppEventBroadcaster I = GetIt.I.get<AppEventBroadcaster>();

  void push(AppEvent event) {
    I._controller.add(event);
  }

  void dispose() {
    _controller.close();
  }

  StreamSubscription<AppEvent> listen(
    void Function(AppEvent event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
