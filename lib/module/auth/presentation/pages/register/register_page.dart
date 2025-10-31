import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/route/app_route_redirect.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_padding.dart';
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
  final formKey = GlobalObjectKey("register_form_key");

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
                      child: RegisterContent(),
                    ),
                    RegisterForm(key: formKey),
                  ],
                ),
              ),
            );
          }

          return Padding(
            padding: AppPadding.responsive(context),
            child: Row(
              spacing: 64,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: context.isMobileSize ? 3 : 6,
                  child: RegisterContent(),
                ),
                Flexible(
                  flex: context.isMobileSize ? 7 : 4,
                  child: RegisterForm(key: formKey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

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

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Register",
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
          text: "Register",
          onPressed: () {
            AppRouteRedirect.alreadyLogin = true;
            context.goNamed(AppRouteName.home);
          },
        ),
        DesignButton(
          type: DesignButtonType.text,
          size: DesignButtonSize.large,
          text: "Back",
          onPressed: context.pop,
        ),
      ],
    );
  }
}
