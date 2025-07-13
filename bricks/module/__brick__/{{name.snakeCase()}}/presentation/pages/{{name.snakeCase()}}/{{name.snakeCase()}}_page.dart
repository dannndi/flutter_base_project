
import 'package:flutter/material.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const {{name.pascalCase()}}UI();
  }
}

class {{name.pascalCase()}}UI extends StatefulWidget {
  const {{name.pascalCase()}}UI({super.key});

  @override
  State<{{name.pascalCase()}}UI> createState() => _{{name.pascalCase()}}UIState();
}

class _{{name.pascalCase()}}UIState extends State<{{name.pascalCase()}}UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("{{name.pascalCase()}} Page")));
  }
}
