import 'package:base_project/core/component/textfield/design_dropdown.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('should render dropdown and open dialog on tap', (tester) async {
    String? selectedValue;

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: DesignDropdown<String>(
              values: ['Apple', 'Banana', 'Cherry'],
              textBuilder: (v) => v,
              onChanged: (val) {
                selectedValue = val;
              },
              labelText: 'Fruit',
            ),
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    final richText = tester.widget<RichText>(
      find
          .descendant(
            of: find.byType(DesignTextfield),
            matching: find.byType(RichText),
          )
          .first,
    );

    expect(richText.text.toPlainText(), "Fruit");
    expect(find.byType(DesignTextfield), findsOneWidget);

    // Tap to open dialog
    await tester.tap(find.byType(DesignTextfield));
    await tester.pump();

    // Dialog opened
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('Cherry'), findsOneWidget);

    // Select an item
    await tester.tap(find.text('Banana'));
    await tester.pump();

    // TextField updated and onChanged called
    expect(find.text('Banana'), findsOneWidget);
    expect(selectedValue, 'Banana');

    // Tap to open dialog
    await tester.tap(find.byType(DesignTextfield));
    await tester.pump();

    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
  });

  testWidgets('should filter dropdown items when search is enabled', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: DesignDropdown<String>(
              values: ['Apple', 'Banana', 'Cherry'],
              textBuilder: (v) => v,
              enableSearch: true,
              labelText: 'Fruit',
            ),
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    // Open dialog
    await tester.tap(find.byType(DesignTextfield));
    await tester.pump();

    // Enter search query
    final searchField = find.descendant(
      of: find.byType(Dialog),
      matching: find.byType(DesignTextfield),
    );

    await tester.enterText(searchField, 'Ch');
    await tester.pump();

    // Only Cherry should be visible
    expect(find.text('Apple'), findsNothing);
    expect(find.text('Banana'), findsNothing);
    expect(find.text('Cherry'), findsOneWidget);
  });
}
