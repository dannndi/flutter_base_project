import 'package:base_project/core/component/pages/loading_page_wrapper.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:flutter/material.dart';

class LoadingPageExamplePage extends StatelessWidget {
  const LoadingPageExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Page Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: LoadingPageWrapper(
        isLoading: true,
        child: Center(),
      ),
    );
  }
}
