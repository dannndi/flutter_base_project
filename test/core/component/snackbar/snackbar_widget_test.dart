import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/snackbar/snackbar_widget.dart';
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

    final context = tester.element(find.byType(Scaffold));
    final theme = Theme.of(context);

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, theme.colorScheme.inverseSurface);
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

    final context = tester.element(find.byType(Scaffold));
    final theme = Theme.of(context);

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, theme.colorScheme.inverseSurface);

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
                      prefix: (color) => Icon(Icons.home),
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

    final context = tester.element(find.byType(Scaffold));
    final theme = Theme.of(context);

    expect(find.byType(SnackBar), findsOne);
    expect(snackBar.backgroundColor, theme.colorScheme.inverseSurface);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets("should show snackbar with suffix and hide default OK button", (
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
                    showSnackbar(
                      context,
                      message: "Snackbar with suffix",
                      suffix: (color) => Icon(
                        Icons.close,
                        key: const Key("suffix_icon"),
                        color: color,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );

    // open snackbar
    await tester.tap(find.text("Show Snackbar"));
    await tester.pump();

    // snackbar exists
    expect(find.byType(SnackBar), findsOneWidget);

    // suffix icon exists
    expect(find.byKey(const Key("suffix_icon")), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);

    // OK button should NOT exist
    expect(find.text("OK"), findsNothing);
  });
}
