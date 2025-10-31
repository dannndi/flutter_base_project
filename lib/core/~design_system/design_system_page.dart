import 'package:base_project/core/~design_system/pages/button_example_page.dart';
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
            title: Text("Typography Example"),
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
            title: Text("Button Example"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtonExamplePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
