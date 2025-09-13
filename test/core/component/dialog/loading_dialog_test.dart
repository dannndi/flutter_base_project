import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("should show default loading dialog", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: DesignButton(
                text: 'Show Loading',
                onPressed: () {
                  showLoadingDialog(context);
                },
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Show Loading"));
    await tester.pump();

    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(
      find.descendant(of: find.byType(Dialog), matching: find.byType(Text)),
      findsNothing,
    );
  });

  testWidgets("should show loading dialog with text", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: DesignButton(
                text: 'Show Loading',
                onPressed: () {
                  showLoadingDialog(context, message: "Please wait !!");
                },
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Show Loading"));
    await tester.pump();

    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text("Please Wait !!"), findsNothing);
  });
}
