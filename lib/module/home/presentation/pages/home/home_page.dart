import 'package:base_project/core/l10n/cubit/language_cubit.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: GestureDetector(
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
      ),
    );
  }
}
