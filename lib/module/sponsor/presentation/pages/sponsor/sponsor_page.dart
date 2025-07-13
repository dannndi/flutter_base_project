import 'package:base_project/core/component/pages/loading_page_wrapper.dart';
import 'package:flutter/material.dart';

class SponsorPage extends StatelessWidget {
  const SponsorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SponsorUI();
  }
}

class SponsorUI extends StatefulWidget {
  const SponsorUI({super.key});

  @override
  State<SponsorUI> createState() => _SponsorUIState();
}

class _SponsorUIState extends State<SponsorUI> {
  @override
  Widget build(BuildContext context) {
    return LoadingPageWrapper(
      isLoading: true,
      child: Scaffold(body: Center(child: Text("Sponsor Page"))),
    );
  }
}
