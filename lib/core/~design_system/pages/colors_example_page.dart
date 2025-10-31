import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class ColorsExamplePage extends StatelessWidget {
  const ColorsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colors Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Table(
              children: [
                TableRow(
                  children: [
                    _ColorContainer(
                      text: "On Primary",
                      color: Theme.of(context).colorScheme.primary,
                      onColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    _ColorContainer(
                      text: "On Secondary",
                      color: Theme.of(context).colorScheme.secondary,
                      onColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    _ColorContainer(
                      text: "On Ternary",
                      color: Theme.of(context).colorScheme.tertiary,
                      onColor: Theme.of(context).colorScheme.onTertiary,
                    ),
                    _ColorContainer(
                      text: "On Surface",
                      color: Theme.of(context).colorScheme.surface,
                      onColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    _ColorContainer(
                      text: "On Inverse Surface",
                      color: Theme.of(context).colorScheme.inverseSurface,
                      onColor: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    SizedBox(),
                  ],
                ),
                TableRow(
                  children: [
                    _ColorContainer(
                      text: "On Error",
                      color: AppColor.danger,
                      onColor: AppColor.backgroundWhite,
                    ),
                    _ColorContainer(
                      text: "On Warning",
                      color: AppColor.warning,
                      onColor: AppColor.backgroundWhite,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    _ColorContainer(
                      text: "On Info",
                      color: AppColor.info,
                      onColor: AppColor.backgroundWhite,
                    ),
                    _ColorContainer(
                      text: "On Success",
                      color: AppColor.success,
                      onColor: AppColor.backgroundWhite,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    required this.text,
    required this.color,
    required this.onColor,
  });

  final String text;
  final Color color;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(color: color, border: Border.all()),
      alignment: Alignment.center,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: onColor),
      ),
    );
  }
}
