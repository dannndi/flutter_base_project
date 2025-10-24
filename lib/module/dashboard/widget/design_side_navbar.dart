import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/module/dashboard/widget/floating_action_widget.dart';
import 'package:flutter/material.dart';

class DesignSideNavbar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> bottomNavBarItems;

  const DesignSideNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.bottomNavBarItems,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entries = bottomNavBarItems.asMap().entries;

    return Container(
      padding: EdgeInsets.all(24),
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
        crossAxisAlignment: context.responsiveValue(
          desktop: CrossAxisAlignment.start,
          tablet: CrossAxisAlignment.center,
          mobile: CrossAxisAlignment.center,
        ),
        children: [
          ...entries.map((entry) {
            return InkWell(
              onTap: () => onTap(entry.key),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                color: Colors.transparent,
                child: Row(
                  spacing: context.responsiveValue(
                    desktop: 12,
                    tablet: 8,
                    mobile: 4,
                  ),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        child: currentIndex == entry.key
                            ? entry.value.activeIcon
                            : entry.value.icon,
                      ),
                    ),
                    if (context.isDesktopSize)
                      Text(
                        entry.value.label ?? "",
                        style: currentIndex == entry.key
                            ? theme.textTheme.titleMedium?.copyWith(
                                color: AppColor.primaryColor,
                              )
                            : theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 48),
          FloatingActionWidget(),
        ],
      ),
    );
  }
}
