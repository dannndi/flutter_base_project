import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/dialog/design_dialog.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class DialogExamplePage extends StatelessWidget {
  const DialogExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignButton(
              text: "Show Default Dialog",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DesignDialog(
                      title: "Delete this item?",
                      subtitle:
                          "This action cannot be undone. Are you sure you want to proceed?",
                      negativeText: "Cancel",
                      positiveText: "Delete",
                    );
                  },
                );
              },
            ),
            DesignButton(
              text: "Show Success Dialog",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DesignDialog(
                      image: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 72,
                      ),
                      title: "Success!",
                      subtitle: "Your data has been saved successfully.",
                      positiveText: "Great",
                      onPositive: () => Navigator.pop(context),
                    );
                  },
                );
              },
            ),
            DesignButton(
              text: "Show Warning Dialog",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DesignDialog(
                      image: Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.amber,
                        size: 64,
                      ),
                      title: "Unsaved Changes",
                      subtitle:
                          "You have unsaved changes. Leaving this page will discard them.",
                      positiveText: "Got it",
                    );
                  },
                );
              },
            ),
            DesignButton(
              text: "Show Info Dialog",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DesignDialog(
                      title: "App Version 2.3.1",
                      subtitle:
                          "Includes new dark mode support and bug fixes for profile page.",
                    );
                  },
                );
              },
            ),
            DesignButton(
              text: "Show Terms Dialog",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DesignDialog(
                      title: "Accept Terms & Conditions",
                      subtitle:
                          "By continuing, you agree to our terms and privacy policy. Make sure to review all details carefully before proceeding.",
                      negativeText: "Decline",
                      positiveText: "Accept",
                    );
                  },
                );
              },
            ),
            DesignButton(
              text: "Show Cancel-Only Dialog",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DesignDialog(
                      title: "Feature Unavailable",
                      subtitle:
                          "This feature will be available in a future update.",
                      negativeText: "Close",
                    );
                  },
                );
              },
            ),
            DesignButton(
              text: "Show Simple Dialog with Controlled Align",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DesignDialog(
                      title: "Feature Unavailable",
                      titleAlign: TextAlign.start,
                      subtitle:
                          "This feature will be available in a future update.",
                      subtitleAlign: TextAlign.start,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
