import 'package:base_project/core/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashUI();
  }
}

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      context.goNamed(AppRouteName.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    // can be blank screen, it's only purpose is as initialization/redirection page
    return const Scaffold(body: Center(child: FlutterLogo(size: 64)));
  }
}
