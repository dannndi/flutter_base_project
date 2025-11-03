import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';

class DesignLinearProgressIndicator extends StatelessWidget {
  const DesignLinearProgressIndicator({
    super.key,
    required this.value,
    this.showPercentage = true,
  });

  /// in 0-1 range
  final double value;
  final bool showPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            minHeight: 8,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            backgroundColor: Theme.of(
              context,
            ).primaryColor.withValues(alpha: 0.2),
          ),
        ),
        if (showPercentage)
          Text(
            "${(value * 100).toStringAsFixed(0)}%",
            style: Theme.of(context).textTheme.titleSmall,
          ),
      ],
    );
  }
}
