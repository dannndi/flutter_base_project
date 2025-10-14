
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountUI();
  }
}

class AccountUI extends StatefulWidget {
  const AccountUI({super.key});

  @override
  State<AccountUI> createState() => _AccountUIState();
}

class _AccountUIState extends State<AccountUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Account Page")));
  }
}
