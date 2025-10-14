import 'dart:async';

import 'package:flutter/material.dart';

class AutoCounterPage extends StatefulWidget {
  const AutoCounterPage({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  State<AutoCounterPage> createState() => _AutoCounterPageState();
}

class _AutoCounterPageState extends State<AutoCounterPage> {
  int _counter = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // clean up timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
