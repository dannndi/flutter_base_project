import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  warning(AppColor.warning, AppColor.blackGrey),
  error(AppColor.danger, AppColor.offWhite),
  success(AppColor.success, AppColor.blackGrey);

  const SnackbarType(
    this.backgroundColor,
    this.foregroundColor,
  );
  final Color backgroundColor;
  final Color foregroundColor;
}

void showSnackbar(
  BuildContext context, {
  required String message,
  Widget Function(Color color)? prefix,
  Widget Function(Color color)? suffix,
  SnackbarType? type,
  bool showButton = true,
  String buttonText = "OK",
}) {
  final theme = Theme.of(context);
  final foregroundColor = type == null
      ? Theme.of(context).colorScheme.onInverseSurface
      : type.foregroundColor;
  final backgroundColor = type == null
      ? theme.colorScheme.inverseSurface
      : type.backgroundColor;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
      backgroundColor: backgroundColor,
      padding: EdgeInsets.all(4),
      content: Row(
        children: [
          if (prefix != null) ...[
            const SizedBox(width: 12),
            prefix(foregroundColor),
          ],
          Expanded(
            child: Padding(
              padding: prefix != null
                  ? const EdgeInsets.fromLTRB(12, 16, 16, 16)
                  : const EdgeInsets.all(16),
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: foregroundColor,
                ),
              ),
            ),
          ),
          if (suffix != null) suffix.call(foregroundColor),
          if (suffix == null && showButton)
            DesignButton(
              type: DesignButtonType.text,
              size: DesignButtonSize.mini,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: (_, _) => Text(
                buttonText,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: foregroundColor,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
