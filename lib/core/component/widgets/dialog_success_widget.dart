import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class DialogSuccessWidget extends StatelessWidget {
  const DialogSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      padding: AppPadding.large,
      child: Icon(
        Icons.check_rounded,
        color: context.colorScheme.primary,
        size: 48,
      ),
    );
  }
}
