// coverage:ignore-file

import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:flutter/widgets.dart';

class AppPadding {
  AppPadding._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;

  static const mbl = 24.0;
  static const tbl = 64.0;
  static const dsk = 128.0;

  static const none = EdgeInsets.all(0);
  static const small = EdgeInsets.all(sm);
  static const medium = EdgeInsets.all(md);
  static const large = EdgeInsets.all(lg);

  static const noneVertical = EdgeInsets.symmetric(vertical: 0);
  static const smallVertical = EdgeInsets.symmetric(vertical: sm);
  static const mediumVertical = EdgeInsets.symmetric(vertical: md);
  static const largeVertical = EdgeInsets.symmetric(vertical: lg);

  static const noneHorizontal = EdgeInsets.symmetric(horizontal: 0);
  static const smallHorizontal = EdgeInsets.symmetric(horizontal: sm);
  static const mediumHorizontal = EdgeInsets.symmetric(horizontal: md);
  static const largeHorizontal = EdgeInsets.symmetric(horizontal: lg);

  static const mobile = EdgeInsets.all(mbl);
  static const tablet = EdgeInsets.all(tbl);
  static const desktop = EdgeInsets.all(dsk);

  static EdgeInsetsGeometry responsive(BuildContext context) {
    return context.responsiveValue(
      desktop: desktop,
      tablet: tablet,
      mobile: mobile,
    );
  }

  static EdgeInsetsGeometry responsiveHorizontal(BuildContext context) {
    return context.responsiveValue(
      desktop: EdgeInsets.symmetric(horizontal: dsk),
      tablet: EdgeInsets.symmetric(horizontal: tbl),
      mobile: EdgeInsets.symmetric(horizontal: mbl),
    );
  }

  static EdgeInsetsGeometry responsiveVertical(BuildContext context) {
    return context.responsiveValue(
      desktop: EdgeInsets.symmetric(vertical: dsk),
      tablet: EdgeInsets.symmetric(vertical: tbl),
      mobile: EdgeInsets.symmetric(vertical: mbl),
    );
  }

  static const btnMini = EdgeInsets.all(10);
  static const btnMedium = EdgeInsets.all(14);
  static const btnLarge = EdgeInsets.all(16);

  static const listTile = EdgeInsets.symmetric(horizontal: lg, vertical: md);
}
