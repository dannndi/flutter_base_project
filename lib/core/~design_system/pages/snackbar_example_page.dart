import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/snackbar/snackbar_widget.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class SnackbarExamplePage extends StatelessWidget {
  const SnackbarExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar Example"),
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
              text: "Show Default Snackbar",
              onPressed: () {
                showSnackbar(context, message: "This is default snackbar");
              },
            ),
            DesignButton(
              text: "Show Snackbar with long info",
              onPressed: () {
                showSnackbar(
                  context,
                  message:
                      "This is default snackbar with long information and this it will look like, and it will not trim / cut any text you put in here",
                );
              },
            ),
            DesignButton(
              text: "Show Snackbar without button",
              onPressed: () {
                showSnackbar(
                  context,
                  message: "This is default snackbar",
                  showButton: false,
                );
              },
            ),
            DesignButton(
              text: "Show Snackbar with different button text",
              onPressed: () {
                showSnackbar(
                  context,
                  message: "This is default snackbar with icon",
                  buttonText: "Sure!",
                );
              },
            ),
            DesignButton(
              text: "Show Snackbar with prefix icon",
              onPressed: () {
                showSnackbar(
                  context,
                  message: "This is default snackbar with icon",
                  prefix: (color) => Icon(Icons.check_circle, color: color),
                );
              },
            ),
            DesignButton(
              text: "Show Snackbar with suffix icon",
              onPressed: () {
                showSnackbar(
                  context,
                  message: "This is default snackbar with icon",
                  suffix: (color) => IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: Icon(Icons.check_circle, color: color),
                  ),
                );
              },
            ),
            DesignButton(
              text: "Show Warning Snackbar",
              onPressed: () {
                showSnackbar(
                  context,
                  type: SnackbarType.warning,
                  message: "This is warning snackbar",
                );
              },
            ),
            DesignButton(
              text: "Show Success Snackbar",
              onPressed: () {
                showSnackbar(
                  context,
                  type: SnackbarType.success,
                  message: "This is success snackbar",
                );
              },
            ),
            DesignButton(
              text: "Show Error Snackbar",
              onPressed: () {
                showSnackbar(
                  context,
                  type: SnackbarType.error,
                  message: "This is error snackbar",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
