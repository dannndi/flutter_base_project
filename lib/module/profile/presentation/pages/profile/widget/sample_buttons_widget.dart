import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SampleButtonsWidget extends StatelessWidget {
  const SampleButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...DesignButtonType.values.expand((type) {
          return [
            Text(
              type.name.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...DesignButtonSize.values.map(
              (size) => Column(
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
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const Divider(height: 32),
          ];
        }),
        Text("CUSTOM COLOR", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...DesignButtonSize.values.map(
          (size) => Column(
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
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
