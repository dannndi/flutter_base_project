import 'dart:async';

import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventUI();
  }
}

class EventUI extends StatefulWidget {
  const EventUI({super.key});

  @override
  State<EventUI> createState() => _EventUIState();
}

class _EventUIState extends State<EventUI> {
  Timer? _timer;
  final timerNotifier = ValueNotifier(0);

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      timerNotifier.value += 1;
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: timerNotifier,
          builder: (context, time, _) {
            return Text(time.toString(), style: style.headlineMedium);
          },
        ),
      ),
    );
  }
}
