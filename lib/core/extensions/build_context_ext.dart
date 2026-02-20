import 'package:base_project/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get intl => AppLocalizations.of(this)!;

  static const _maxMobile = 600;
  static const _maxTablet = 1024;

  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isMobileSize {
    return MediaQuery.of(this).size.width < _maxMobile;
  }

  bool get isTabletSize {
    final width = MediaQuery.of(this).size.width;
    return width >= _maxMobile && width <= _maxTablet;
  }

  bool get isDesktopSize {
    return MediaQuery.of(this).size.width > _maxTablet;
  }

  bool get isWideSize {
    return isTabletSize || isDesktopSize;
  }

  T responsiveValue<T>({
    required T desktop,
    required T tablet,
    required T mobile,
  }) {
    if (isDesktopSize) return desktop;
    if (isTabletSize) return tablet;
    if (isMobileSize) return mobile;

    return mobile;
  }
}
