import 'dart:async';

class CountdownTimer {
  int _countdownSeconds;
  late Timer _timer;
  final Function(int)? _onTick;
  final Function()? _onFinished;

  CountdownTimer({
    required int seconds,
    Function(int)? onTick,
    Function()? onFinished,
  })  : _countdownSeconds = seconds,
        _onTick = onTick,
        _onFinished = onFinished;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countdownSeconds--;

      if (_onTick != null) {
        _onTick(_countdownSeconds);
      }

      if (_countdownSeconds <= 0) {
        stop();
        if (_onFinished != null) {
          _onFinished();
        }
      }
    });
  }

  void stop() {
    _timer.cancel();
    _countdownSeconds = 0;
  }
}
