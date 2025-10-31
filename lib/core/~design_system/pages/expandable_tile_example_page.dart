import 'package:base_project/core/component/list_tile/design_expandable_tile.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class ExpandableTileExamplePage extends StatelessWidget {
  const ExpandableTileExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignExpandableTile(
              title: Text("What is responsive_sheet?"),
              subtitle: Text(
                "A Flutter package to create adaptive bottom sheets that fit any screen size.",
              ),
            ),
            DesignExpandableTile(
              title: Text("How to add responsive_sheet to my project?"),
              subtitle: Text(
                "Just add the package to your pubspec.yaml, import it, and start using ResponsiveSheetWidget in your app.",
              ),
            ),
            DesignExpandableTile(
              title: Text("Does it support web and desktop?"),
              subtitle: Text(
                "Yes! It automatically adapts layout and behavior for web, mobile, and desktop platforms.",
              ),
            ),
            DesignExpandableTile(
              title: Text("Can I customize animations?"),
              subtitle: Text(
                "Absolutely. You can modify duration, curve, and transitions for a smoother user experience.",
              ),
            ),
            DesignExpandableTile(
              title: Text("Is dark mode supported by default?"),
              subtitle: Text(
                "Yes, responsive_sheet follows your app’s ThemeData brightness setting automatically.",
              ),
            ),
            DesignExpandableTile(
              title: Text("How do I preview changes before implementing?"),
              subtitle: Text(
                "The latest update includes a live preview where you can experiment with parameters directly in your browser.",
              ),
            ),
            DesignExpandableTile(
              title: Text("Is it compatible with Flutter 3.24+?"),
              subtitle: Text(
                "Yes, the package fully supports Flutter 3.24 and Material 3 design system.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
