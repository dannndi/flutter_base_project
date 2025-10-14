import 'package:base_project/core/route/app_route_name.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/module/home/domain/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreCourseListPage extends StatelessWidget {
  const ExploreCourseListPage({
    super.key,
    this.selectedId,
  });

  final String? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: CourseModel.dummyCourses.length,
        separatorBuilder: (_, _) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context, index) {
          final course = CourseModel.dummyCourses[index];
          return ExploreCourseListItemWidget(
            isSelected: selectedId == course.id.toString(),
            course: course,
          );
        },
      ),
    );
  }
}

class ExploreCourseListItemWidget extends StatelessWidget {
  const ExploreCourseListItemWidget({
    super.key,
    this.isSelected = false,
    required this.course,
  });

  final bool isSelected;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          AppRouteName.exploreDetail,
          pathParameters: {
            "id": course.id.toString(),
          },
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColor.info.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Row(
          spacing: 16,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: course.color.withValues(alpha: 0.1),
              ),
              child: Icon(
                course.icon,
                color: course.color,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                  ),
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: course.mentorName,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: " • ",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: course.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
