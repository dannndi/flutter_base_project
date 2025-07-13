import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle displayLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 52,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle displayMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 42,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle displaySmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineSmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 22,
  );

  static const TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 18,
  );

  static const TextStyle titleSmall = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 14,
  );

  static const TextStyle labelLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 14,
  );
  static const TextStyle labelMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 12,
  );

  static const TextStyle labelSmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 11,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 16,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 14,
  );

  static const TextStyle bodySmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 12,
  );
}

Widget textThemeSample(BuildContext context) {
  final theme = Theme.of(context);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("displayLarge", style: theme.textTheme.displayLarge),
      Text("displayMedium", style: theme.textTheme.displayMedium),
      Text("displaySmall", style: theme.textTheme.displaySmall),
      Text("headlineLarge", style: theme.textTheme.headlineLarge),
      Text("headlineMedium", style: theme.textTheme.headlineMedium),
      Text("headlineSmall", style: theme.textTheme.headlineSmall),
      Text("titleLarge", style: theme.textTheme.titleLarge),
      Text("titleMedium", style: theme.textTheme.titleMedium),
      Text("titleSmall", style: theme.textTheme.titleSmall),
      Text("labelLarge", style: theme.textTheme.labelLarge),
      Text("labelMedium", style: theme.textTheme.labelMedium),
      Text("labelSmall", style: theme.textTheme.labelSmall),
      Text("bodyLarge", style: theme.textTheme.bodyLarge),
      Text("bodyMedium", style: theme.textTheme.bodyMedium),
      Text("bodySmall", style: theme.textTheme.bodySmall),
    ],
  );
}
