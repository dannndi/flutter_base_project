import 'package:base_project/core/component/checkbox/design_checkbox.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:flutter/material.dart';

class CheckboxExamplePage extends StatelessWidget {
  const CheckboxExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Checkbox with Enable State",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DesignCheckbox(
              value: true,
              onChanged: (value) {},
            ),
            DesignCheckbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              "Checkbox with Disable State",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DesignCheckbox(value: true),
            DesignCheckbox(value: false),
          ],
        ),
      ),
    );
  }
}
