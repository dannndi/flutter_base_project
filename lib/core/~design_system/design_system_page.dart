import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/component/widgets/language_picker.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/~design_system/pages/button_example_page.dart';
import 'package:base_project/core/~design_system/pages/switch_example_page.dart';
import 'package:base_project/core/~design_system/pages/typography_example_page.dart';
import 'package:flutter/material.dart';

class DesignSystemPage extends StatelessWidget {
  const DesignSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Design System"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(context.intl.change_language),
            trailing: LanguagePicker(),
          ),
          ListTile(
            title: Text(context.intl.dark_mode),
            trailing: DesignThemeSwitch(),
          ),
          ListTile(
            title: Text("Typography"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TypographyExamplePage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Button"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtonExamplePage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Switch"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SwitchExamplePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
