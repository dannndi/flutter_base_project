import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesignSwitch extends StatelessWidget {
  const DesignSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeCubit>().state.isDark;

    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      thumbColor:  AppColor.backgroundWhite,
      inactiveThumbColor: AppColor.backgroundWhite,
      activeTrackColor: theme.primaryColor,
      inactiveTrackColor: isDark ? Colors.transparent : AppColor.neutral,
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)) return theme.primaryColor;
        return AppColor.neutral;
      }),
    );
  }
}
