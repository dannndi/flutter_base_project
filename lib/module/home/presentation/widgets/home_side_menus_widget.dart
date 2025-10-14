import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeSideMenusWidget extends StatelessWidget {
  const HomeSideMenusWidget({
    super.key,
    required this.currentPath,
  });

  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          "Explore",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        SideMenuItem(
          title: "Explore",
          isSelected: currentPath.contains(AppRouteName.explore),
          onTap: () {
            context.goNamed(AppRouteName.explore);
          },
        ),
        SideMenuItem(
          title: "Latest Course",
          isSelected: currentPath.contains(AppRouteName.latestCourse),
          onTap: () {
            context.goNamed(AppRouteName.latestCourse);
          },
        ),
        SideMenuItem(
          title: "Most Popular Course",
          isSelected: currentPath.contains(AppRouteName.mostPopularCourse),
          onTap: () {
            context.goNamed(AppRouteName.mostPopularCourse);
          },
        ),
        const SizedBox(height: 24),
        Text(
          "Account",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        SideMenuItem(
          title: "Cart",
          isSelected: currentPath.contains(AppRouteName.cart),
          onTap: () {
            context.goNamed(AppRouteName.cart);
          },
        ),
        SideMenuItem(
          title: "My Course",
          isSelected: currentPath.contains(AppRouteName.myCourse),
          onTap: () {
            context.goNamed(AppRouteName.myCourse);
          },
        ),
        SideMenuItem(
          title: "Invite Friends",
          isSelected: currentPath.contains(AppRouteName.inviteFriends),
          onTap: () {
            context.goNamed(AppRouteName.inviteFriends);
          },
        ),
        SideMenuItem(
          title: "Help Center",
          isSelected: currentPath.contains(AppRouteName.helpCenter),
          onTap: () {
            context.goNamed(AppRouteName.helpCenter);
          },
        ),
        if (context.isTabletSize || context.isMobileSize)
          SideMenuItem(
            title: "Business",
            isSelected: currentPath.contains(AppRouteName.business),
            onTap: () {
              context.goNamed(AppRouteName.business);
            },
          ),
      ],
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    super.key,
    this.onTap,
    this.isSelected = false,
    required this.title,
  });

  final void Function()? onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColor.primarySwatch.shade50.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected ? AppColor.primaryColor : null,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
