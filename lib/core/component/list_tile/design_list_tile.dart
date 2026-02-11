import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';

class DesignListTile extends StatelessWidget {
  const DesignListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.showDefaultTrailing = true,
    this.trailing,
    this.onTap,
    this.shape,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final bool showDefaultTrailing;
  final Widget? trailing;
  final VoidCallback? onTap;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.medium,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.md,
          horizontal: AppPadding.lg,
        ),
        decoration: ShapeDecoration(
          shape:
              shape ??
              RoundedRectangleBorder(
                borderRadius: AppRadius.medium,
                side: BorderSide(
                  color: AppColor.neutral,
                ),
              ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null) ...[
              ?leading,
              const SizedBox(width: 16),
            ],
            Expanded(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style:
                          Theme.of(context).textTheme.titleSmall ?? TextStyle(),
                      child: title,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      subtitle!,
                    ],
                  ],
                ),
              ),
            ),
            if (trailing != null || showDefaultTrailing) ...[
              const SizedBox(width: 16),
              trailing ??
                  (showDefaultTrailing
                      ? const Icon(Icons.arrow_forward_ios_rounded, size: 18)
                      : const SizedBox.shrink()),
            ],
          ],
        ),
      ),
    );
  }
}
