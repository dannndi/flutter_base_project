import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class ButtonExamplePage extends StatelessWidget {
  const ButtonExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Example"),
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
            ...DesignButtonType.values.expand((type) {
              return [
                Text(
                  type.name.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ...DesignButtonSize.values.map(
                  (size) => Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DesignButton(
                        type: type,
                        size: size,
                        text: "${type.name} (${size.name})",
                        onPressed: () {},
                      ),
                      DesignButton(
                        type: type,
                        size: size,
                        text: "${type.name} (${size.name}) (disabled)",
                        onPressed: () {},
                        enabled: false,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 32),
              ];
            }),
            Text(
              "CUSTOM COLOR",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...DesignButtonSize.values.map(
              (size) => Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DesignButton(
                    type: DesignButtonType.outlined,
                    size: size,
                    text: "Custom Color",
                    customColor: DesignButtonColors(
                      color: AppColor.danger,
                      childColor: AppColor.danger,
                      disableColor: AppColor.neutral[700]!,
                      disableChildColor: AppColor.neutral[200]!,
                    ),
                    onPressed: () {},
                  ),
                  DesignButton(
                    type: DesignButtonType.outlined,
                    size: size,
                    text: "Custom Color",
                    customColor: DesignButtonColors(
                      color: AppColor.danger,
                      childColor: AppColor.danger,
                      disableColor: AppColor.lightRed,
                      disableChildColor: AppColor.lightRed,
                    ),
                    onPressed: () {},
                    enabled: false,
                  ),
                ],
              ),
            ),
            Text(
              "WITH ICON",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...DesignButtonSize.values.map(
              (size) => Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DesignButton(
                    type: DesignButtonType.outlined,
                    size: size,
                    prefixIcon: Icon(Icons.check_circle),
                    text: "With icon",
                    onPressed: () {},
                  ),
                  DesignButton(
                    type: DesignButtonType.outlined,
                    size: size,
                    text: "With icon",
                    suffixIcon: Icon(Icons.check_circle),
                    onPressed: () {},
                    enabled: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
