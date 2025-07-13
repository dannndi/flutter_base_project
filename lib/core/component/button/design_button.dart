import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

enum DesignButtonSize { mini, medium, large }

enum DesignButtonType { primary, secondary, ternary, outlined, text }

class DesignButtonColors {
  final Color color;
  final Color childColor;
  final Color disableColor;
  final Color disableChildColor;

  DesignButtonColors({
    required this.color,
    required this.childColor,
    required this.disableColor,
    required this.disableChildColor,
  });
}

class DesignButton extends StatelessWidget {
  const DesignButton({
    super.key,
    this.enabled = true,
    this.onPressed,
    this.text,
    this.child,
    this.size = DesignButtonSize.medium,
    this.type = DesignButtonType.primary,
    this.customColor,
  });

  final bool enabled;
  final VoidCallback? onPressed;
  final String? text;
  final Widget Function(Color color, TextStyle? style)? child;
  final DesignButtonSize size;
  final DesignButtonType type;
  final DesignButtonColors? customColor;

  @override
  Widget build(BuildContext context) {
    final colors = customColor ?? _getButtonColors();
    final color = enabled ? colors.color : colors.disableColor;
    final childColor = enabled ? colors.childColor : colors.disableChildColor;

    final buttonSize = _getSize(context);
    final padding = _getPadding();
    final textStyle = _getTextStyle(context, childColor);

    final content =
        child?.call(childColor, textStyle) ??
        Text(text ?? '', style: textStyle);

    final BorderRadius borderRadius = BorderRadius.circular(12);

    switch (type) {
      case DesignButtonType.outlined:
        return OutlinedButton(
          onPressed: enabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.5, color: color),
            backgroundColor: AppColor.white,
            disabledBackgroundColor: AppColor.white,
            minimumSize: buttonSize,
            padding: padding,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: content,
        );

      case DesignButtonType.text:
        return TextButton(
          onPressed: enabled ? onPressed : null,
          style: TextButton.styleFrom(
            minimumSize: buttonSize,
            padding: padding,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: content,
        );

      default:
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            disabledBackgroundColor: color,
            minimumSize: buttonSize,
            padding: padding,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            elevation: enabled ? 0.5 : 0,
          ),
          child: content,
        );
    }
  }

  DesignButtonColors _getButtonColors() {
    switch (type) {
      case DesignButtonType.primary:
        return DesignButtonColors(
          color: AppColor.primaryColor,
          childColor: AppColor.white,
          disableColor: AppColor.neutral[700]!,
          disableChildColor: AppColor.neutral[200]!,
        );
      case DesignButtonType.secondary:
        return DesignButtonColors(
          color: AppColor.secondaryColor,
          childColor: AppColor.white,
          disableColor: AppColor.neutral[700]!,
          disableChildColor: AppColor.neutral[200]!,
        );
      case DesignButtonType.ternary:
        return DesignButtonColors(
          color: AppColor.white,
          childColor: AppColor.primaryColor,
          disableColor: AppColor.neutral[700]!,
          disableChildColor: AppColor.neutral[200]!,
        );
      case DesignButtonType.outlined:
        return DesignButtonColors(
          color: AppColor.primaryColor,
          childColor: AppColor.primaryColor,
          disableColor: AppColor.neutral[200]!,
          disableChildColor: AppColor.neutral[200]!,
        );

      case DesignButtonType.text:
        return DesignButtonColors(
          color: AppColor.white,
          childColor: AppColor.primaryColor,
          disableColor: AppColor.white,
          disableChildColor: AppColor.neutral[200]!,
        );
    }
  }

  Size _getSize(BuildContext context) {
    switch (size) {
      case DesignButtonSize.mini:
        return const Size(72, 0);
      case DesignButtonSize.medium:
        return const Size(144, 0);
      case DesignButtonSize.large:
        return Size(MediaQuery.sizeOf(context).width, 42);
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case DesignButtonSize.mini:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
      case DesignButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case DesignButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    }
  }

  TextStyle? _getTextStyle(BuildContext context, Color color) {
    final baseStyle = switch (size) {
      DesignButtonSize.mini => Theme.of(context).textTheme.bodySmall,
      DesignButtonSize.medium => Theme.of(context).textTheme.bodyMedium,
      DesignButtonSize.large => Theme.of(context).textTheme.titleSmall,
    };

    return baseStyle?.copyWith(fontWeight: FontWeight.bold, color: color);
  }
}

Widget designButtonSample(BuildContext context) {
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
