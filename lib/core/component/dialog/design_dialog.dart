import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesignDialog extends StatelessWidget {
  const DesignDialog({
    super.key,
    this.image,
    this.title,
    this.titleAlign = TextAlign.center,
    this.subtitle,
    this.subtitleAlign = TextAlign.center,
    this.negativeText,
    this.positiveText,
    this.onNegative,
    this.onPositive,
  });

  final Widget? image;
  final String? title;
  final TextAlign titleAlign;
  final String? subtitle;
  final TextAlign subtitleAlign;
  final String? negativeText;
  final String? positiveText;
  final VoidCallback? onNegative;
  final VoidCallback? onPositive;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: context.responsiveValue(
        desktop: EdgeInsets.all(96),
        tablet: EdgeInsets.all(64),
        mobile: EdgeInsets.all(48),
      ),
      child: Container(
        width: context.responsiveValue(desktop: 420, tablet: 400, mobile: 340),
        padding: AppPadding.large,
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (image != null) ...[
              const SizedBox(height: 4),
              image!,
              const SizedBox(height: 4),
            ],

            if (title != null)
              Text(
                title ?? "",
                textAlign: titleAlign,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            if (subtitle != null)
              Text(
                subtitle ?? "",
                textAlign: subtitleAlign,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
              ),
            if (negativeText != null || positiveText != null) ...[
              const SizedBox(height: 4),
              Row(
                spacing: 8,
                children: [
                  if (negativeText != null)
                    Expanded(
                      child: DesignButton(
                        size: context.responsiveValue(
                          desktop: DesignButtonSize.medium,
                          tablet: DesignButtonSize.medium,
                          mobile: DesignButtonSize.mini,
                        ),
                        type: DesignButtonType.text,
                        text: negativeText,
                        onPressed: onNegative ?? context.pop,
                      ),
                    ),
                  if (positiveText != null)
                    Expanded(
                      child: DesignButton(
                        size: context.responsiveValue(
                          desktop: DesignButtonSize.medium,
                          tablet: DesignButtonSize.medium,
                          mobile: DesignButtonSize.mini,
                        ),
                        type: DesignButtonType.primary,
                        text: positiveText,
                        onPressed: onPositive,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
