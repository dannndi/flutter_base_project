import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouteRedirect {
  AppRouteRedirect._();

  static bool alreadyLogin = false;

  /// will redirect to home if already logged in
  static String? needNoAuth(BuildContext context, GoRouterState state) {
    // TODO :  change to actual implementation
    if (alreadyLogin) {
      return "/home";
    }

    return null;
  }

  /// will redirect to auth/login if not logged in
  static String? needAuth(BuildContext context, GoRouterState state) {
    // TODO :  change to actual implementation
    if (!alreadyLogin) {
      return "/auth";
    }

    return null;
  }
}
