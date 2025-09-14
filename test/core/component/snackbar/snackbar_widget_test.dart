import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/snackbar/snackbar_widget.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("should show default snackbar", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: DesignButton(
                  text: "Show Snackbar",
                  onPressed: () {
                    showSnackbar(context, message: "Default Snackbar");
                  },
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Show Snackbar"));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, AppColor.neutral);
  });

  testWidgets("should able to close default snackbar by clicking ok", (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: DesignButton(
                  text: "Show Snackbar",
                  onPressed: () {
                    showSnackbar(context, message: "Default Snackbar");
                  },
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Show Snackbar"));
    await tester.pump();
    await tester.pump(Duration(seconds: 1));

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, AppColor.neutral);

    await tester.tap(find.text("OK"));
    await tester.pump();
    await tester.pump(Duration(seconds: 1));

    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets("should show correct type of snackbar", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: DesignButton(
                  text: "Show Snackbar",
                  onPressed: () {
                    showSnackbar(
                      context,
                      type: SnackbarType.success,
                      message: "Success Snackbar",
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Show Snackbar"));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, SnackbarType.success.backgroundColor);
  });

  testWidgets("should show snackbar with icon prefix", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: DesignButton(
                  text: "Show Snackbar",
                  onPressed: () {
                    showSnackbar(
                      context,
                      message: "Snackbar with prefix",
                      prefixIcon: Icon(Icons.home),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Show Snackbar"));
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, AppColor.neutral);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });
}
