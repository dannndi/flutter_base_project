import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/module/dashboard/widget/design_bottom_navbar.dart';
import 'package:base_project/module/dashboard/widget/design_side_navbar.dart';
import 'package:base_project/module/dashboard/widget/floating_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarItemData {
  final BottomNavigationBarItem item;
  final String destinationRoute;

  BottomNavBarItemData({required this.item, required this.destinationRoute});
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.state, required this.child});

  final StatefulNavigationShell child;
  final GoRouterState state;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<BottomNavBarItemData> get bottomNavBarItems => [
    BottomNavBarItemData(
      destinationRoute: "/home",
      item: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(
          Icons.home,
          color: context.colorScheme.primary,
        ),
        label: "Home",
      ),
    ),
    BottomNavBarItemData(
      destinationRoute: "/event",
      item: BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        activeIcon: Icon(
          Icons.calendar_month,
          color: context.colorScheme.primary,
        ),
        label: "Event",
      ),
    ),
    BottomNavBarItemData(
      destinationRoute: "/sponsor",
      item: BottomNavigationBarItem(
        icon: Icon(Icons.campaign),
        activeIcon: Icon(
          Icons.campaign,
          color: context.colorScheme.primary,
        ),
        label: "Sponsor",
      ),
    ),
    BottomNavBarItemData(
      destinationRoute: "/profile",
      item: BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(
          Icons.person,
          color: context.colorScheme.primary,
        ),
        label: "Profile",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (!context.isMobileSize)
            DesignSideNavbar(
              currentIndex: widget.child.currentIndex,
              onTap: onItemClicked,
              bottomNavBarItems: bottomNavBarItems.map((e) => e.item).toList(),
            ),
          Flexible(child: widget.child),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: bottomNavBarItems.length % 2 == 0
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endContained,
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Widget? _buildFloatingActionButton(BuildContext context) {
    if (!context.isMobileSize) return null;

    return MediaQuery.of(context).viewInsets.bottom > 0
        ? const SizedBox.shrink()
        : FloatingActionWidget();
  }

  Widget? _buildBottomNavigation(BuildContext context) {
    if (!context.isMobileSize) return null;

    return DesignBottomNavbar(
      currentIndex: widget.child.currentIndex,
      onTap: onItemClicked,
      bottomNavBarItems: bottomNavBarItems.map((e) => e.item).toList(),
    );
  }

  void onItemClicked(int index) {
    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex,
    );
  }
}
