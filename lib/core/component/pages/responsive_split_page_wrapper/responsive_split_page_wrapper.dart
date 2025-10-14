import 'package:flutter/material.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';

enum MobileDisplayMode { side, main }

/// A responsive layout that shows a [side] panel and a [main] content area.
///
/// - On **mobile**: shows either [side] or [main] depending on [mobileDisplayMode].
/// - On **tablet/desktop**: shows both side-by-side.
/// - Automatically keeps both widgets alive when hidden.
class ResponsiveSplitPageWrapper extends StatelessWidget {
  const ResponsiveSplitPageWrapper({
    super.key,
    required this.main,
    required this.side,
    this.sideDesktopWidth = 380.0,
    this.sideTabletWidth = 300.0,
    this.mobileDisplayMode = MobileDisplayMode.main,
    this.showSide,
    this.showMain,
  });

  final Widget main;
  final Widget side;
  final double sideDesktopWidth;
  final double sideTabletWidth;

  /// Controls which view is shown on narrow (mobile) screens.
  final MobileDisplayMode mobileDisplayMode;

  final bool Function(BuildContext)? showSide;
  final bool Function(BuildContext)? showMain;

  @override
  Widget build(BuildContext context) {
    final isWide = context.isTabletSize || context.isDesktopSize;
    final sideDefault = isWide || mobileDisplayMode == MobileDisplayMode.side;
    final mainDefault = isWide || mobileDisplayMode == MobileDisplayMode.main;

    final showSide = this.showSide?.call(context) ?? sideDefault;
    final showMain = this.showMain?.call(context) ?? mainDefault;

    final menuWidth = context.responsiveValue(
      desktop: sideDesktopWidth,
      tablet: sideTabletWidth,
      mobile: MediaQuery.sizeOf(context).width,
    );

    final mainLeft = showSide ? menuWidth : 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            children: [
              Visibility.maintain(
                visible: showSide,
                child: SizedBox(width: menuWidth, child: side),
              ),
              Positioned.fill(
                left: mainLeft,
                child: Visibility.maintain(
                  visible: showMain,
                  child: main,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
