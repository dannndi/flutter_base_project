import 'package:base_project/core/component/pages/dummy/dummy_page.dart';
import 'package:base_project/core/component/pages/responsive_split_page_wrapper/responsive_split_page_wrapper.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/route/routes/latest_course_route.dart';
import 'package:base_project/module/home/domain/model/course_model.dart';
import 'package:base_project/module/home/presentation/pages/course_detail/course_detail_page.dart';
import 'package:base_project/module/home/presentation/pages/explore_course/explore_course_list_page.dart';
import 'package:base_project/module/home/presentation/widgets/home_shell_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRoute {
  AppRoute._();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        redirect: (_, _) => "/explore",
        builder: (_, _) => SizedBox(),
      ),
      ShellRoute(
        builder: (context, state, widget) {
          return HomeShellPage(
            state: state,
            child: widget,
          );
        },
        routes: [
          /// you can have shell route like this
          ShellRoute(
            builder: (context, state, child) {
              final id = state.pathParameters["id"];
              return ResponsiveSplitPageWrapper(
                mobileDisplayMode: id == null
                    ? MobileDisplayMode.side
                    : MobileDisplayMode.main,
                side: ExploreCourseListPage(selectedId: id),
                main: child,
              );
            },
            routes: [
              GoRoute(
                path: "/explore",
                name: AppRouteName.explore,
                builder: (context, state) {
                  return DummyPage(
                    title: "Select course first",
                    color: Colors.white,
                  );
                },
                routes: [
                  GoRoute(
                    path: ":id",
                    name: AppRouteName.exploreDetail,
                    builder: (context, state) {
                      final id = state.pathParameters["id"];

                      final course = CourseModel.getDummyCourseDetail(id ?? "");
                      return CourseDetailPage(course: course);
                    },
                  ),
                ],
              ),
            ],
          ),

          /// or wrap it on other class that extend [ShellRoute]
          LatestCourseRoute(),
        ],
      ),
    ],
  );
}
