import 'package:base_project/core/component/list_tile/design_list_tile.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/component/widgets/language_picker.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:base_project/core/~design_system/pages/button_example_page.dart';
import 'package:base_project/core/~design_system/pages/checkbox_example_page.dart';
import 'package:base_project/core/~design_system/pages/colors_example_page.dart';
import 'package:base_project/core/~design_system/pages/dropdown_example_page.dart';
import 'package:base_project/core/~design_system/pages/switch_example_page.dart';
import 'package:base_project/core/~design_system/pages/textfield_example_page.dart';
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
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 8,
          children: [
            DesignListTile(
              title: Text(context.intl.change_language),
              trailing: LanguagePicker(),
            ),
            DesignListTile(
              title: Text(context.intl.dark_mode),
              trailing: DesignThemeSwitch(),
            ),
            DesignListTile(
              title: Text("Colors"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ColorsExamplePage(),
                  ),
                );
              },
            ),
            DesignListTile(
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
            DesignListTile(
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
            DesignListTile(
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
            DesignListTile(
              title: Text("Checkbox"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckboxExamplePage(),
                  ),
                );
              },
            ),
            DesignListTile(
              title: Text("Textfield"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextfieldExamplePage(),
                  ),
                );
              },
            ),
            DesignListTile(
              title: Text("Dropdown"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DropdownExamplePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
