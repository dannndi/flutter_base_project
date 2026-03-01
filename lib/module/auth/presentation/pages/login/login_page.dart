import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/route/app_route_redirect.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
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
  final formKey = GlobalObjectKey("login_form_key");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (context.isMobileSize) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: AppPadding.responsive(context),
                child: Column(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 86),
                      child: LoginContent(),
                    ),
                    LoginForm(key: formKey),
                  ],
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: AppPadding.responsive(context),
            child: Row(
              spacing: 64,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: context.isMobileSize ? 3 : 6,
                  child: LoginContent(),
                ),
                Flexible(
                  flex: context.isMobileSize ? 7 : 4,
                  child: LoginForm(key: formKey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        DesignTextfield(
          labelText: "Email",
          hintText: "Enter your email",
          maxLines: 1,
          textInputAction: TextInputAction.next,
        ),
        DesignTextfield(
          labelText: "Password",
          hintText: "Enter your password",
          obscureText: true,
          maxLines: 1,
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
    );
  }
}
