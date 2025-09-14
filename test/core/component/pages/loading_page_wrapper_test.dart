import 'package:base_project/core/component/pages/loading_page_wrapper.dart';
import 'package:base_project/core/component/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "should show loading and its child",
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoadingPageWrapper(
            isLoading: true,
            child: Scaffold(
              body: Center(
                child: Text("Body"),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(LoadingAnimation), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("Body"), findsOneWidget);
    },
  );

  testWidgets(
    "should show not loading and only show its child",
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoadingPageWrapper(
            isLoading: false,
            child: Scaffold(
              body: Center(
                child: Text("Body"),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(LoadingAnimation), findsNothing);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text("Body"), findsOneWidget);
    },
  );
}
