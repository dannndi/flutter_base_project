import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class DesignBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> bottomNavBarItems;

  const DesignBottomNavbar({
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
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.06),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:
            entries.map((entry) {
                return Expanded(
                  flex: 7,
                  child: GestureDetector(
                    onTap: () => onTap(entry.key),
                    child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child:
                                currentIndex == entry.key
                                    ? entry.value.activeIcon
                                    : entry.value.icon,
                          ),
                          const SizedBox(height: 6.5),
                          Text(
                            entry.value.label ?? "",
                            style:
                                currentIndex == entry.key
                                    ? theme.textTheme.titleSmall?.copyWith(
                                      color: AppColor.primaryColor,
                                    )
                                    : theme.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList()
              // space for floating button
              ..insert(2, const Expanded(flex: 5, child: SizedBox())),
      ),
    );
  }
}
