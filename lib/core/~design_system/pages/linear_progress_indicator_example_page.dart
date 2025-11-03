import 'package:base_project/core/component/progress/design_circular_progress_widget.dart';
import 'package:base_project/core/component/progress/design_linear_progress_widget.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorExamplePage extends StatelessWidget {
  const LinearProgressIndicatorExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Indicator Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignLinearProgressIndicator(value: 0.2),
            DesignLinearProgressIndicator(value: 0.4),
            DesignLinearProgressIndicator(value: 0.8),
            DesignLinearProgressIndicator(value: 1),
            DesignLinearProgressIndicator(value: 0.4, showPercentage: false),
            const SizedBox(height: 32),
            DesignCircularProgressIndicator(value: 0.2),
            DesignCircularProgressIndicator(value: 0.4),
            DesignCircularProgressIndicator(value: 0.8),
            DesignCircularProgressIndicator(value: 1),
            DesignCircularProgressIndicator(value: 0.4, showPercentage: false),
            DesignCircularProgressIndicator(value: 0.4, size: 78),
            DesignCircularProgressIndicator(value: 0.3, size: 108),
            DesignCircularProgressIndicator(value: 0.6, size: 124),
          ],
        ),
      ),
    );
  }
}
