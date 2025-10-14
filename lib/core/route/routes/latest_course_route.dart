import 'package:base_project/core/component/pages/dummy/dummy_page.dart';
import 'package:base_project/core/component/pages/responsive_split_page_wrapper/responsive_split_page_wrapper.dart';
import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/module/home/domain/model/course_model.dart';
import 'package:base_project/module/home/presentation/pages/course_detail/course_detail_page.dart';
import 'package:base_project/module/home/presentation/pages/latest_course/latest_course_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LatestCourseRoute extends ShellRoute {
  LatestCourseRoute()
    : super(
        builder: (context, state, child) {
          final id = state.pathParameters["id"];
          return ResponsiveSplitPageWrapper(
            mobileDisplayMode: id == null
                ? MobileDisplayMode.side
                : MobileDisplayMode.main,
            side: LatestCourseListPage(selectedId: id),
            main: child,
          );
        },
        routes: [
          GoRoute(
            path: "/latest-course",
            name: AppRouteName.latestCourse,
            builder: (context, state) {
              return DummyPage(
                title: "Select course first",
                color: Colors.white,
              );
            },
            routes: [
              GoRoute(
                path: ":id",
                name: AppRouteName.latestCourseDetail,
                builder: (context, state) {
                  final id = state.pathParameters["id"];

                  final course = CourseModel.getLatestCourseDetail(id ?? "");
                  return CourseDetailPage(course: course);
                },
              ),
            ],
          ),
        ],
      );
}
