import 'package:base_project/core/component/list_tile/design_list_tile.dart';
import 'package:base_project/core/component/sheet/responsive_sheet.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/extensions/locale_ext.dart';
import 'package:base_project/core/l10n/cubit/language_cubit.dart';
import 'package:base_project/core/l10n/generated/app_localizations.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sheet/responsive_sheet.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => showLanguageSheet(
            context,
            state.current,
          ),
          borderRadius: AppRadius.medium,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.current.emoji,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  state.current.text,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showLanguageSheet(BuildContext context, Locale current) async {
    final result = await showResponsiveBottomSheet<Locale>(
      context,
      typeBuilder: (context) {
        return context.responsiveValue(
          desktop: ResponsiveSheetType.dialog,
          tablet: ResponsiveSheetType.dialog,
          mobile: ResponsiveSheetType.sheet,
        );
      },
      styleBuilder: (context, type) {
        return ResponsiveSheetStyle(borderRadius: AppRadius.large);
      },
      builder: (context, type) {
        return _LanguagePickerWidget(type: type, current: current);
      },
    );

    if (!context.mounted || result == null) return;
    context.read<LanguageCubit>().changeLanguage(result);
  }
}

class _LanguagePickerWidget extends StatelessWidget {
  const _LanguagePickerWidget({
    required this.type,
    required this.current,
  });

  final ResponsiveSheetType type;
  final Locale current;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSheet(
      type: type,
      title: context.intl.select_language,
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...AppLocalizations.supportedLocales.map((locale) {
            return DesignListTile(
              onTap: () {
                context.pop(locale);
              },
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.medium,
              ),
              leading: Text(
                locale.emoji,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              title: Text(locale.text),
              trailing: Row(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (locale.languageCode == current.languageCode)
                    Container(
                      padding: AppPadding.small,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.1),
                        borderRadius: AppRadius.xLarge,
                      ),
                      child: Text(
                        "Selected",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
