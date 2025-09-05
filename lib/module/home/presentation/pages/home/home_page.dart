import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/l10n/cubit/language_cubit.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            GestureDetector(
              onTap: () {
                final current = context.read<LanguageCubit>().state.current;

                if (current.languageCode == "en") {
                  context.read<LanguageCubit>().changeLanguage(Locale("id"));
                } else {
                  context.read<LanguageCubit>().changeLanguage(Locale("en"));
                }
              },
              child: Text(
                "Tap to change language\ncurrent = ${context.intl.language}",
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                final current = context.read<ThemeCubit>().state.current;

                if (current == ThemeMode.system || current == ThemeMode.light) {
                  context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
                } else {
                  context.read<ThemeCubit>().changeTheme(ThemeMode.light);
                }
              },
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Text(
                    "Tap to change language\ncurrent = ${state.current}",
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
            DesignButton(
              type: DesignButtonType.text,
              text: "Login",
              onPressed: () {
                context.goNamed(AppRouteName.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
