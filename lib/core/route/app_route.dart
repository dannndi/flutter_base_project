import 'dart:async';

import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/module/dashboard/dashboard_page.dart';
import 'package:base_project/module/event/presentation/pages/event/event_page.dart';
import 'package:base_project/module/home/presentation/pages/home/home_page.dart';
import 'package:base_project/module/profile/presentation/pages/profile/profile_page.dart';
import 'package:base_project/module/splash/presentation/pages/splash/splash_page.dart';
import 'package:base_project/module/sponsor/presentation/pages/sponsor/sponsor_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final Completer<void> rootNavigatorCompleter = Completer<void>();
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final bottomNavigatorKey = GlobalKey<StatefulNavigationShellState>(
  debugLabel: 'bottom',
);

class AppRoute {
  AppRoute._();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    initialLocation: "/",
    routes: [
      // default path is to /home
      GoRoute(path: "/", redirect: (context, state) => "/splash"),
      GoRoute(
        path: "/splash",
        name: AppRouteName.splash,
        builder: (context, state) {
          return SplashPage();
        },
      ),
      GoRoute(
        path: "/onboarding",
        builder: (context, state) {
          return SizedBox();
        },
      ),
      GoRoute(
        path: "/auth",
        builder: (context, state) {
          return SizedBox();
        },
        routes: [
          GoRoute(
            path: "register",
            builder: (context, state) {
              return SizedBox();
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        key: bottomNavigatorKey,
        builder: (context, state, child) {
          return DashboardPage(state: state, child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/home",
                name: AppRouteName.home,
                builder: (context, state) {
                  return HomePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/event",
                builder: (context, state) {
                  return EventPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/sponsor",
                builder: (context, state) {
                  return SponsorPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/profile",
                builder: (context, state) {
                  return ProfilePage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
