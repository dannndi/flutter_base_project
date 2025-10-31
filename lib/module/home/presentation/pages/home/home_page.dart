import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/~design_system/design_system_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeUI();
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            DesignButton(
              type: DesignButtonType.outlined,
              text: "See all Component Available",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DesignSystemPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
