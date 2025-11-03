import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/component/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class LoadingAnimationExamplePage extends StatelessWidget {
  const LoadingAnimationExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Animation Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimation(
              color: Theme.of(context).colorScheme.primary,
            ),
            LoadingAnimation(
              color: Theme.of(context).colorScheme.primary,
              size: 64,
            ),
            LoadingAnimation(
              color: Theme.of(context).colorScheme.secondary,
            ),
            LoadingAnimation(
              color: Theme.of(context).colorScheme.secondary,
              size: 64,
            ),
          ],
        ),
      ),
    );
  }
}
