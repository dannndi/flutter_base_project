import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/route/app_route_redirect.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginUI();
  }
}

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
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
              text: "Login",
              onPressed: () {
                AppRouteRedirect.alreadyLogin = true;
                context.goNamed(AppRouteName.home);
              },
            ),
            DesignButton(
              type: DesignButtonType.outlined,
              size: DesignButtonSize.large,
              text: "Register",
              onPressed: () {
                context.goNamed(AppRouteName.register);
              },
            ),
            DesignButton(
              type: DesignButtonType.text,
              size: DesignButtonSize.large,
              text: "Continue As Guest",
              onPressed: () {
                context.goNamed(AppRouteName.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
