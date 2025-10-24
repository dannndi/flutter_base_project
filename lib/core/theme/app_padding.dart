import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:flutter/widgets.dart';

class AppPadding {
  AppPadding._();

  static const desktop = 128.0;
  static const tablet = 64.0;
  static const mobile = 24.0;

  static double responsiveValue(BuildContext context) {
    return context.responsiveValue(
      desktop: desktop / 2,
      tablet: tablet / 2,
      mobile: mobile / 2,
    );
  }

  static double responsiveFullValue(BuildContext context) {
    return context.responsiveValue(
      desktop: desktop,
      tablet: tablet,
      mobile: mobile,
    );
  }

  static EdgeInsetsGeometry get desktopAll {
    return EdgeInsets.all(desktop);
  }

  static EdgeInsetsGeometry get desktopHorizontal {
    return EdgeInsets.symmetric(horizontal: desktop);
  }

  static EdgeInsetsGeometry get desktopVertical {
    return EdgeInsets.symmetric(vertical: desktop);
  }

  static EdgeInsetsGeometry get tabletAll {
    return EdgeInsets.all(tablet);
  }

  static EdgeInsetsGeometry get tabletHorizontal {
    return EdgeInsets.symmetric(horizontal: tablet);
  }

  static EdgeInsetsGeometry get tabletVertical {
    return EdgeInsets.symmetric(vertical: tablet);
  }

  static EdgeInsetsGeometry get mobileAll {
    return EdgeInsets.all(mobile);
  }

  static EdgeInsetsGeometry get mobileHorizontal {
    return EdgeInsets.symmetric(horizontal: mobile);
  }

  static EdgeInsetsGeometry get mobileVertical {
    return EdgeInsets.symmetric(vertical: mobile);
  }

  static EdgeInsetsGeometry responsiveAll(BuildContext context) {
    return context.responsiveValue(
      desktop: EdgeInsets.all(desktop),
      tablet: EdgeInsets.all(tablet),
      mobile: EdgeInsets.all(mobile),
    );
  }

  static EdgeInsetsGeometry responsiveHorizontal(BuildContext context) {
    return context.responsiveValue(
      desktop: EdgeInsets.symmetric(horizontal: desktop),
      tablet: EdgeInsets.symmetric(horizontal: tablet),
      mobile: EdgeInsets.symmetric(horizontal: mobile),
    );
  }

  static EdgeInsetsGeometry responsiveVertical(BuildContext context) {
    return context.responsiveValue(
      desktop: EdgeInsets.symmetric(vertical: desktop),
      tablet: EdgeInsets.symmetric(vertical: tablet),
      mobile: EdgeInsets.symmetric(vertical: mobile),
    );
  }
}
