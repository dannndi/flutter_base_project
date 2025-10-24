import 'package:base_project/core/component/page_transition/no_transition_builder.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_textstyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.backgroundWhite,
    primarySwatch: AppColor.primarySwatch,
    textTheme: const TextTheme(
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineLarge: AppTextStyle.headlineLarge,
      headlineMedium: AppTextStyle.headlineMedium,
      headlineSmall: AppTextStyle.headlineSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleSmall: AppTextStyle.titleSmall,
      titleMedium: AppTextStyle.titleMedium,
      labelLarge: AppTextStyle.labelLarge,
      labelMedium: AppTextStyle.labelMedium,
      labelSmall: AppTextStyle.labelSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundWhite,
      surfaceTintColor: AppColor.backgroundWhite,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: kIsWeb ? _noTransitionBuilders : _defaultTransitionBuilders,
    ),
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.backgroundBlack,
    primaryColor: AppColor.primaryColor,
    primarySwatch: AppColor.primarySwatch,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge.copyWith(color: AppColor.white),
      displayMedium: AppTextStyle.displayMedium.copyWith(color: AppColor.white),
      displaySmall: AppTextStyle.displaySmall.copyWith(color: AppColor.white),
      headlineLarge: AppTextStyle.headlineLarge.copyWith(color: AppColor.white),
      headlineMedium: AppTextStyle.headlineMedium.copyWith(
        color: AppColor.white,
      ),
      headlineSmall: AppTextStyle.headlineSmall.copyWith(color: AppColor.white),
      titleLarge: AppTextStyle.titleLarge.copyWith(color: AppColor.white),
      titleSmall: AppTextStyle.titleSmall.copyWith(color: AppColor.white),
      titleMedium: AppTextStyle.titleMedium.copyWith(color: AppColor.white),
      labelLarge: AppTextStyle.labelLarge.copyWith(color: AppColor.white),
      labelMedium: AppTextStyle.labelMedium.copyWith(color: AppColor.white),
      labelSmall: AppTextStyle.labelSmall.copyWith(color: AppColor.white),
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: AppColor.white),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(color: AppColor.white),
      bodySmall: AppTextStyle.bodySmall.copyWith(color: AppColor.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundBlack,
      surfaceTintColor: AppColor.backgroundBlack,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: kIsWeb ? _noTransitionBuilders : _defaultTransitionBuilders,
    ),
  );

  static const _noTransitionBuilders = {
    TargetPlatform.android: NoTransitionBuilder(),
    TargetPlatform.iOS: NoTransitionBuilder(),
    TargetPlatform.macOS: NoTransitionBuilder(),
    TargetPlatform.windows: NoTransitionBuilder(),
    TargetPlatform.linux: NoTransitionBuilder(),
  };

  static const _defaultTransitionBuilders = {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    TargetPlatform.linux: ZoomPageTransitionsBuilder(),
  };
}
