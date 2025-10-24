import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/route/app_route_redirect.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterUI();
  }
}

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          children: [
            DesignTextfield(
              labelText: "Email",
              hintText: "Enter your email",
            ),
            DesignTextfield(
              labelText: "Password",
              hintText: "Enter your password",
            ),
            DesignButton(
              size: DesignButtonSize.large,
              text: "Register",
              onPressed: () {
                AppRouteRedirect.alreadyLogin = true;
                context.goNamed(AppRouteName.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
