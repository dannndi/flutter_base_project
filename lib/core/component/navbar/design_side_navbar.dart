import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class DesignSideNavbar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  final List<Widget> additionalWidget;

  const DesignSideNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.bottomNavBarItems,
    this.additionalWidget = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entries = bottomNavBarItems.asMap().entries;

    final menus = Column(
      crossAxisAlignment: context.isTabletSize
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: entries.map((entry) {
        final isSelected = currentIndex == entry.key;

        return InkWell(
          onTap: () => onTap(entry.key),
          child: Container(
            width: context.responsiveValue(
              desktop: 120,
              tablet: 78,
              mobile: null,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            decoration: isSelected
                ? BoxDecoration(
                    color: context.colorScheme.primary.withValues(
                      alpha: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            child: Flex(
              direction: context.isTabletSize ? Axis.vertical : Axis.horizontal,
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.responsiveValue(
                    desktop: 28,
                    tablet: 26,
                    mobile: 24,
                  ),
                  width: context.responsiveValue(
                    desktop: 28,
                    tablet: 26,
                    mobile: 24,
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: isSelected
                        ? entry.value.activeIcon
                        : entry.value.icon,
                  ),
                ),
                Text(
                  entry.value.label ?? "",
                  style: isSelected
                      ? theme.textTheme.titleSmall?.copyWith(
                          color: context.colorScheme.primary,
                        )
                      : theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );

    return Container(
      padding: AppPadding.large.add(
        EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          right: BorderSide(
            color: AppColor.border,
          ),
        ),
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          menus,
          const SizedBox(height: 48),
          ...additionalWidget,
        ],
      ),
    );
  }
}
