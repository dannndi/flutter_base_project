import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class DesignBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  final FloatingActionButtonLocation? fabLocation;

  const DesignBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.bottomNavBarItems,
    this.fabLocation,
  });

  @override
  Widget build(BuildContext context) {
    final entries = bottomNavBarItems.asMap().entries;

    final navItems = entries.map(
      (entry) {
        final isSelected = currentIndex == entry.key;
        return _buildBottomNavItem(
          context,
          entry.key,
          entry.value,
          isSelected,
        );
      },
    ).toList();

    const centerDockedLocations = {
      FloatingActionButtonLocation.centerDocked,
      FloatingActionButtonLocation.miniCenterDocked,
    };

    const endDockedLocations = {
      FloatingActionButtonLocation.endContained,
      FloatingActionButtonLocation.endDocked,
      FloatingActionButtonLocation.miniEndDocked,
    };

    if (centerDockedLocations.contains(fabLocation)) {
      navItems.insert(
        (navItems.length / 2).floor(),
        const Spacer(flex: 5),
      );
    } else if (endDockedLocations.contains(fabLocation)) {
      navItems.add(
        const Spacer(flex: 7),
      );
    }

    return Container(
      padding: EdgeInsets.all(8).add(
        EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
        children: navItems,
      ),
    );
  }

  Widget _buildBottomNavItem(
    BuildContext context,
    int index,
    BottomNavigationBarItem item,
    bool isSelected,
  ) {
    final theme = Theme.of(context);

    return Expanded(
      flex: 7,
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: isSelected ? item.activeIcon : item.icon,
              ),
              const SizedBox(height: 6),
              Text(
                item.label ?? "",
                style: isSelected
                    ? theme.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.primary,
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
  }
}
