import 'package:base_project/core/theme/app_color.dart';
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
    return ListTile(
      title: title,
      subtitle: subtitle != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                subtitle!,
              ],
            )
          : null,
      leading: leading,
      trailing:
          trailing ??
          (showDefaultTrailing
              ? Icon(Icons.arrow_forward_ios_rounded, size: 18)
              : null),
      shape:
          shape ??
          RoundedRectangleBorder(
            borderRadius: AppRadius.medium,
            side: BorderSide(
              color: AppColor.neutral,
            ),
          ),
      onTap: onTap,
    );
  }
}
