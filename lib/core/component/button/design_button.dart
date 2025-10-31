import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:base_project/core/theme/app_radius.dart';
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
    this.prefixIcon,
    this.suffixIcon,
    this.size = DesignButtonSize.medium,
    this.type = DesignButtonType.primary,
    this.customColor,
  });

  final bool enabled;
  final VoidCallback? onPressed;
  final String? text;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Widget Function(Color color, TextStyle? style)? child;
  final DesignButtonSize size;
  final DesignButtonType type;
  final DesignButtonColors? customColor;

  @override
  Widget build(BuildContext context) {
    final colors = customColor ?? _getButtonColors(context);
    final color = enabled ? colors.color : colors.disableColor;
    final childColor = enabled ? colors.childColor : colors.disableChildColor;

    final buttonSize = _getSize(context);
    final padding = _getPadding();
    final textStyle = _getTextStyle(context, childColor);
    final borderRadius = _getBorderRadius();


    Widget? content = child?.call(childColor, textStyle);

    content ??= Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (prefixIcon != null) prefixIcon!,
        Text(text ?? '', style: textStyle),
        if (suffixIcon != null) suffixIcon!,
      ],
    );


    switch (type) {
      case DesignButtonType.outlined:
        return OutlinedButton(
          onPressed: enabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.2, color: color),
            minimumSize: buttonSize,
            padding: padding,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            tapTargetSize: MaterialTapTargetSize.padded,
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
            tapTargetSize: MaterialTapTargetSize.padded,
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
            tapTargetSize: MaterialTapTargetSize.padded,
          ),
          child: content,
        );
    }
  }

  DesignButtonColors _getButtonColors(BuildContext context) {
    switch (type) {
      case DesignButtonType.primary:
        return DesignButtonColors(
          color: context.colorScheme.primary,
          childColor: context.colorScheme.onPrimary,
          disableColor: AppColor.neutral[700]!,
          disableChildColor: AppColor.neutral[200]!,
        );
      case DesignButtonType.secondary:
        return DesignButtonColors(
          color: context.colorScheme.secondary,
          childColor: context.colorScheme.onSecondary,
          disableColor: AppColor.neutral[700]!,
          disableChildColor: AppColor.neutral[200]!,
        );
      case DesignButtonType.ternary:
        return DesignButtonColors(
          color: context.colorScheme.tertiary,
          childColor: context.colorScheme.onTertiary,
          disableColor: AppColor.neutral[700]!,
          disableChildColor: AppColor.neutral[200]!,
        );
      case DesignButtonType.outlined:
        return DesignButtonColors(
          color: context.colorScheme.primary,
          childColor: context.colorScheme.primary,
          disableColor: AppColor.neutral[200]!,
          disableChildColor: AppColor.neutral[200]!,
        );

      case DesignButtonType.text:
        return DesignButtonColors(
          color: AppColor.white,
          childColor: context.colorScheme.primary,
          disableColor: AppColor.white,
          disableChildColor: AppColor.neutral[200]!,
        );
    }
  }

  Size _getSize(BuildContext context) {
    switch (size) {
      case DesignButtonSize.mini:
        return const Size(72, 36);
      case DesignButtonSize.medium:
        return const Size(144, 52);
      case DesignButtonSize.large:
        return Size(MediaQuery.sizeOf(context).width, 52);
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case DesignButtonSize.mini:
        return AppPadding.btnMini;
      case DesignButtonSize.medium:
        return AppPadding.btnMedium;
      case DesignButtonSize.large:
        return AppPadding.btnLarge;
    }
  }

  BorderRadius _getBorderRadius() {
    switch (size) {
      case DesignButtonSize.mini:
        return AppRadius.small;
      case DesignButtonSize.medium:
        return AppRadius.medium;
      case DesignButtonSize.large:
        return AppRadius.medium;
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
