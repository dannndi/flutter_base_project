import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/module/dashboard/widget/design_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarItemData {
  final BottomNavigationBarItem icon;
  final String destinationRoute;

  BottomNavBarItemData({required this.icon, required this.destinationRoute});
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.state, required this.child});

  final StatefulNavigationShell child;
  final GoRouterState state;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final bottomNavBarItems = [
    BottomNavBarItemData(
      destinationRoute: "/home",
      icon: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home, color: AppColor.primaryColor),
        label: "Home",
      ),
    ),
    BottomNavBarItemData(
      destinationRoute: "/event",
      icon: BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        activeIcon: Icon(Icons.calendar_month, color: AppColor.primaryColor),
        label: "Event",
      ),
    ),
    BottomNavBarItemData(
      destinationRoute: "/sponsor",
      icon: BottomNavigationBarItem(
        icon: Icon(Icons.campaign),
        activeIcon: Icon(Icons.campaign, color: AppColor.primaryColor),
        label: "Sponsor",
      ),
    ),
    BottomNavBarItemData(
      destinationRoute: "/profile",
      icon: BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(Icons.person, color: AppColor.primaryColor),
        label: "Profile",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? const SizedBox.shrink()
          : GestureDetector(
              onTap: () async {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, size: 32, color: AppColor.white),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: DesignBottomNavbar(
        currentIndex: widget.child.currentIndex,
        onTap: (index) async {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
        },
        bottomNavBarItems: bottomNavBarItems.map((e) => e.icon).toList(),
      ),
    );
  }
}
