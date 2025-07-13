import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  warning(AppColor.warning),
  error(AppColor.danger),
  success(AppColor.success);

  const SnackbarType(this.backgroundColor);

  final Color backgroundColor;
}

void showSnackbar(
  BuildContext context, {
  required String message,
  Widget? prefixIcon,
  SnackbarType? type,
  bool avoidBottomBar = false,
}) {
  final backgroundColor =
      type == null ? AppColor.neutral : type.backgroundColor;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin:
          avoidBottomBar
              ? const EdgeInsets.only(bottom: 64, left: 16, right: 16)
              : null,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      content: Row(
        children: [
          if (prefixIcon != null) ...[prefixIcon, const SizedBox(width: 8)],
          Expanded(child: Text(message)),
          Builder(
            builder: (ctx) {
              return TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
                },
                child: const Text("OK"),
              );
            },
          ),
        ],
      ),
    ),
  );
}
