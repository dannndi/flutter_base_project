import 'dart:async';

import 'package:base_project/core/utils/app_event/app_event.dart';
import 'package:get_it/get_it.dart';

/// A singleton-based event broadcaster for sending and listening to [AppEvent]s
/// throughout the application.
///
/// Uses a broadcast [StreamController] internally, allowing multiple listeners
/// to subscribe to the same stream of events.
class AppEventBroadcaster {
  /// Internal broadcast [StreamController] for managing event subscriptions.
  final _controller = StreamController<AppEvent>.broadcast();

  /// Internal stream exposed to listeners.
  Stream<AppEvent> get _stream => _controller.stream;

  /// Singleton instance retrieved from GetIt service locator.
  ///
  /// Example usage:
  /// ```dart
  /// AppEventBroadcaster.I.push(MyEvent());
  /// ```
  static AppEventBroadcaster I = GetIt.I.get<AppEventBroadcaster>();

  /// Pushes a new [AppEvent] into the broadcast stream.
  ///
  /// All active listeners will receive this event.
  void push(AppEvent event) {
    I._controller.add(event);
  }

  /// Closes the internal [StreamController].
  ///
  /// After calling this, the broadcaster will no longer accept events
  /// and all active subscriptions will be canceled.
  void dispose() {
    _controller.close();
  }

  /// Subscribes to listen for [AppEvent]s.
  ///
  /// [onData] is called whenever a new event is pushed.
  /// [onError], [onDone], and [cancelOnError] follow the standard Stream API.
  ///
  /// Returns a [StreamSubscription] that can be used to cancel the subscription
  /// when no longer needed.
  ///
  /// Example usage:
  /// ```dart
  /// final sub = AppEventBroadcaster.I.listen((event) {
  ///   print('Received event: $event');
  /// });
  ///
  /// // Later, cancel when done
  /// sub.cancel();
  /// ```
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
