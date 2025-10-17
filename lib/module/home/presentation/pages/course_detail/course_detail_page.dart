import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/pages/dummy/dummy_page.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/module/home/domain/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    super.key,
    this.course,
  });

  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    return CourseDetailUI(course: course);
  }
}

class CourseDetailUI extends StatelessWidget {
  const CourseDetailUI({
    super.key,
    this.course,
  });

  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    if (course == null) {
      return DummyPage(
        title: "Course not found",
        color: Colors.white,
      );
    }

    final padding = context.responsiveValue(
      desktop: const EdgeInsets.symmetric(horizontal: 42),
      tablet: const EdgeInsets.symmetric(horizontal: 32),
      mobile: const EdgeInsets.symmetric(horizontal: 16),
    );

    return Scaffold(
      appBar: context.isMobileSize
          ? AppBar(
              leading: IconButton(
                onPressed: context.pop,
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
            )
          : null,
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 7,
              child: Container(
                decoration: BoxDecoration(
                  color: course?.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  course?.icon,
                  color: course?.color,
                  size: 120,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (_) {
                    return Icon(
                      Icons.star_rounded,
                      color: AppColor.secondaryColor,
                    );
                  }),
                ),
                const SizedBox(width: 4),
                Text(
                  "5.0",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    "(1K Review)",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              course?.title ?? "-",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              course?.description ?? "-",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            _CourseInfoWidget(),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Graphic design is all around us, in a myriad of forms, both on screen and\nin print, yet it is always made up of images and words to create.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: context.responsiveValue(
          desktop: const EdgeInsets.all(32),
          tablet: const EdgeInsets.all(24),
          mobile: const EdgeInsets.all(16),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.backgroundBlack.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Enroll to start your 7-Days trial for free",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    "90 Days left",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 54,
              child: DesignButton(
                size: DesignButtonSize.medium,
                text: "Enroll for Free",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseInfoWidget extends StatelessWidget {
  const _CourseInfoWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailItem(
              icon: Icons.public,
              title: '100% Online Courses',
              subtitle: 'Start now & learn at your own schedule',
            ),
            DetailItem(
              icon: Icons.watch_later_outlined,
              title: '6 Months to Complete',
              subtitle: 'Suggested 4 hours/week',
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailItem(
              icon: Icons.calendar_today_outlined,
              title: 'Flexible Schedule',
              subtitle: 'Set and maintain flexible deadlines',
            ),
            DetailItem(
              icon: Icons.chat_bubble_outline,
              title: 'English',
              subtitle: 'Subtitles: English and Spanish',
            ),
          ],
        ),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const DetailItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFDD835),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
