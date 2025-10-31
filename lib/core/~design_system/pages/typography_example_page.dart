import 'package:base_project/core/component/switch/design_theme_switch.dart';
import 'package:flutter/material.dart';

class TypographyExamplePage extends StatelessWidget {
  const TypographyExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Typography Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("displayLarge", style: theme.textTheme.displayLarge),
            Text("displayMedium", style: theme.textTheme.displayMedium),
            Text("displaySmall", style: theme.textTheme.displaySmall),
            Text("headlineLarge", style: theme.textTheme.headlineLarge),
            Text("headlineMedium", style: theme.textTheme.headlineMedium),
            Text("headlineSmall", style: theme.textTheme.headlineSmall),
            Text("titleLarge", style: theme.textTheme.titleLarge),
            Text("titleMedium", style: theme.textTheme.titleMedium),
            Text("titleSmall", style: theme.textTheme.titleSmall),
            Text("bodyLarge", style: theme.textTheme.bodyLarge),
            Text("bodyMedium", style: theme.textTheme.bodyMedium),
            Text("bodySmall", style: theme.textTheme.bodySmall),
            Text("labelLarge", style: theme.textTheme.labelLarge),
            Text("labelMedium", style: theme.textTheme.labelMedium),
            Text("labelSmall", style: theme.textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
