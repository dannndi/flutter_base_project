import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class TextfieldExamplePage extends StatelessWidget {
  const TextfieldExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignTextfield(
              hintText: "Textfield No Label",
            ),
            DesignTextfield(
              labelText: "Textfield",
            ),
            DesignTextfield(
              labelText: "Textfield UnderLine",
              hintText: "Hint text..",
              type: DesignTextfieldType.underline,
            ),
            DesignTextfield(
              labelText: "Textfield No Decoration",
              hintText: "Hint text..",
              type: DesignTextfieldType.none,
            ),
            DesignTextfield(
              enabled: false,
              labelText: "Disable Textfield",
              hintText: "Hint text..",
            ),
            DesignTextfield(
              labelText: "Textfield with error",
              hintText: "Hint text..",
              errorText: "Error Message",
            ),
            DesignTextfield(
              labelText: "Textfield with multiple line",
              hintText: "Hint text..",
              maxLines: 3,
            ),
            DesignTextfield(
              labelText: "Textfield",
              hintText: "Hint text..",
              obscureText: true,
            ),
            DesignTextfield(
              labelText: "Textfield with Suffix",
              hintText: "Hint text..",
              suffix: Icon(Icons.phone),
            ),
            DesignTextfield(
              labelText: "Textfield with prefix",
              hintText: "Hint text..",
              prefix: Icon(Icons.mail),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
