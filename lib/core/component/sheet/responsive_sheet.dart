import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sheet/responsive_sheet.dart';

class ResponsiveSheet extends StatelessWidget {
  const ResponsiveSheet({
    super.key,
    required this.type,
    required this.title,
    required this.child,
  });

  final ResponsiveSheetType type;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double? width = type == ResponsiveSheetType.dialog
        ? context.responsiveValue(desktop: 480, tablet: 480, mobile: 340)
        : type == ResponsiveSheetType.side
        ? context.responsiveValue(desktop: 860, tablet: 720, mobile: 340)
        : null;

    return Container(
      padding: AppPadding.large,
      width: width,
      decoration: BoxDecoration(
        borderRadius: AppRadius.medium,
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (type == ResponsiveSheetType.dialog ||
              type == ResponsiveSheetType.side)
            DialogIndicator(title: title),
          if (type == ResponsiveSheetType.sheet)
            BottomSheetIndicator(title: title),
          child,
        ],
      ),
    );
  }
}

class DialogIndicator extends StatelessWidget {
  const DialogIndicator({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: context.pop,
          icon: Icon(
            Icons.close,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class BottomSheetIndicator extends StatelessWidget {
  const BottomSheetIndicator({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6,
            width: 32,
            decoration: BoxDecoration(
              color: AppColor.neutral,
              borderRadius: AppRadius.xLarge,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(color: AppColor.neutral),
        ],
      ),
    );
  }
}
