import 'package:base_project/core/component/switch/design_switch.dart';
import 'package:base_project/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesignThemeSwitch extends StatelessWidget {
  const DesignThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return DesignSwitch(
          value: state.current == ThemeMode.dark,
          onChanged: (value) {
            context.read<ThemeCubit>().changeTheme(
              value ? ThemeMode.dark : ThemeMode.light,
            );
          },
        );
      },
    );
  }
}
