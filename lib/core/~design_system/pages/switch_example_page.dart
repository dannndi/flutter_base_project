import 'package:base_project/core/component/switch/design_switch.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class SwitchExamplePage extends StatelessWidget {
  const SwitchExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
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
            Text(
              "Switch with Enable State",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DesignSwitch(
              value: true,
              onChanged: (value) {},
            ),
            DesignSwitch(
              value: false,
              onChanged: (value) {},
            ),

            Text(
              "Switch with Disable State",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DesignSwitch(value: true),
            DesignSwitch(value: false),
          ],
        ),
      ),
    );
  }
}
