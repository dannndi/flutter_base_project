import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/pages/responsive_split_page_wrapper/responsive_split_page_wrapper.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/module/home/presentation/widgets/home_side_menus_widget.dart';
import 'package:base_project/module/home/presentation/widgets/home_top_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShellPage extends StatelessWidget {
  const HomeShellPage({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  String get currentPath => state.uri.path;

  bool get isLevelOne => state.uri.pathSegments.length == 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (isLevelOne || context.isWideSize) ? _buildAppBar(context) : null,
      drawer: context.isDesktopSize ? null : _buildDrawer(context),
      body: ResponsiveSplitPageWrapper(
        sideDesktopWidth: 260,
        showSide: (context) => context.isDesktopSize,
        side: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: HomeSideMenusWidget(currentPath: currentPath),
        ),
        main: child,
      ),
    );
  }

  // ---------- AppBar ----------
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      leadingWidth: context.isDesktopSize ? 200 : null,
      leading: context.isDesktopSize ? _buildAppBarLogo(context) : null,
      title: _buildSearchField(context),
      actions: (context.isWideSize) ? _buildAppBarActions(context) : null,
    );
  }

  Widget _buildAppBarLogo(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.school_outlined, size: 48),
        Text("Course", style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const DesignTextfield(
        type: DesignTextfieldType.none,
        hintText: "What do you want to learn",
        prefix: Icon(Icons.search),
        maxLines: 1,
      ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      if (context.isDesktopSize)
        DesignButton(
          text: "Business",
          type: DesignButtonType.text,
          onPressed: () {},
        ),
      DesignButton(
        text: "Become Mentor",
        type: DesignButtonType.text,
        onPressed: () {},
      ),
      const HomeTopProfileWidget(),
      const SizedBox(width: 32),
    ];
  }

  // ---------- Drawer ----------
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: HomeSideMenusWidget(currentPath: currentPath),
      ),
    );
  }
}
