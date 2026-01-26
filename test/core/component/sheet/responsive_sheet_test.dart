import 'package:base_project/core/component/sheet/responsive_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sheet/responsive_sheet.dart';

void main() {
  Widget buildTestableWidget({
    required Size size,
    required Widget child,
    GoRouter? router,
  }) {
    return MediaQuery(
      data: MediaQueryData(size: size),
      child: router != null
          ? MaterialApp.router(routerConfig: router)
          : MaterialApp(
              home: Scaffold(body: child),
            ),
    );
  }

  group('ResponsiveSheet', () {
    testWidgets(
      'dialog type uses correct width on desktop and shows DialogIndicator',
      (tester) async {
        await tester.pumpWidget(
          buildTestableWidget(
            size: const Size(1200, 800), // desktop
            child: const ResponsiveSheet(
              type: ResponsiveSheetType.dialog,
              title: 'Dialog Title',
              child: Text('Dialog Content'),
            ),
          ),
        );

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );

        expect(container.constraints?.minWidth, 480);
        expect(find.byType(DialogIndicator), findsOneWidget);
        expect(find.text('Dialog Title'), findsOneWidget);
        expect(find.text('Dialog Content'), findsOneWidget);
      },
    );

    testWidgets(
      'side type uses correct width on desktop and shows DialogIndicator',
      (tester) async {
        await tester.pumpWidget(
          buildTestableWidget(
            size: const Size(1200, 800),
            child: const ResponsiveSheet(
              type: ResponsiveSheetType.side,
              title: 'Side Title',
              child: Text('Side Content'),
            ),
          ),
        );

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );

        expect(container.constraints?.minWidth, 860);
        expect(find.byType(DialogIndicator), findsOneWidget);
        expect(find.text('Side Title'), findsOneWidget);
      },
    );

    testWidgets(
      'sheet type has no fixed width and shows BottomSheetIndicator',
      (tester) async {
        await tester.pumpWidget(
          buildTestableWidget(
            size: const Size(375, 812), // mobile
            child: const ResponsiveSheet(
              type: ResponsiveSheetType.sheet,
              title: 'Sheet Title',
              child: Text('Sheet Content'),
            ),
          ),
        );

        final container = tester.widget<Container>(
          find.byType(Container).first,
        );

        expect(container.constraints?.minWidth, isNull);
        expect(find.byType(BottomSheetIndicator), findsOneWidget);
        expect(find.text('Sheet Title'), findsOneWidget);
        expect(find.text('Sheet Content'), findsOneWidget);
      },
    );

    testWidgets(
      'dialog width changes based on screen size (mobile vs desktop)',
      (tester) async {
        // Mobile
        await tester.pumpWidget(
          buildTestableWidget(
            size: const Size(360, 800),
            child: const ResponsiveSheet(
              type: ResponsiveSheetType.dialog,
              child: SizedBox(),
            ),
          ),
        );

        Container container = tester.widget<Container>(
          find.byType(Container).first,
        );
        expect(container.constraints?.minWidth, 340);

        // Desktop
        await tester.pumpWidget(
          buildTestableWidget(
            size: const Size(1400, 900),
            child: const ResponsiveSheet(
              type: ResponsiveSheetType.dialog,
              child: SizedBox(),
            ),
          ),
        );

        container = tester.widget<Container>(find.byType(Container).first);
        expect(container.constraints?.minWidth, 480);
      },
    );

    group('BottomSheetIndicator', () {
      testWidgets(
        'does not render title when title is null',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: BottomSheetIndicator(),
              ),
            ),
          );

          expect(find.byType(Text), findsNothing);
          expect(find.byType(Divider), findsNothing);
        },
      );

      testWidgets(
        'renders title and divider when title is provided',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: BottomSheetIndicator(title: 'Bottom Sheet'),
              ),
            ),
          );

          expect(find.text('Bottom Sheet'), findsOneWidget);
          expect(find.byType(Divider), findsOneWidget);
        },
      );
    });
  });
}
