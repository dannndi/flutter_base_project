import 'dart:math' as math;

import 'package:flutter/material.dart';

class DesignCircularProgressIndicator extends StatelessWidget {
  const DesignCircularProgressIndicator({
    super.key,
    required this.value,
    this.size = 56,
    this.showPercentage = true,
  });

  /// in 0-1 range
  final double value;
  final double size;
  final bool showPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _RoundedCircularPainter(
          value: value,
          strokeWidth: 8,
          color: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(
            context,
          ).primaryColor.withValues(alpha: 0.2),
        ),
        child: showPercentage
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  "${(value * 100).toStringAsFixed(0)}%",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

class _RoundedCircularPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;

  _RoundedCircularPainter({
    required this.value,
    required this.strokeWidth,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final foregroundPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawArc(rect, 0, 2 * math.pi, false, backgroundPaint);

    // Draw progress arc
    final sweep = 2 * math.pi * value;
    canvas.drawArc(rect, -math.pi / 2, sweep, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
