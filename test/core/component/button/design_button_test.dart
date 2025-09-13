import 'package:base_project/core/component/button/design_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders primary button with text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'Click Me',
            type: DesignButtonType.primary,
            onPressed: () {},
          ),
        ),
      ),
    );

    // Should render an ElevatedButton
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Click Me'), findsOneWidget);
  });

  testWidgets('renders secondary button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'Secondary',
            type: DesignButtonType.secondary,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Secondary'), findsOneWidget);
  });

  testWidgets('renders ternary button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'Ternary',
            type: DesignButtonType.ternary,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Ternary'), findsOneWidget);
  });

  testWidgets('renders outlined button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'Outline',
            type: DesignButtonType.outlined,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect(find.text('Outline'), findsOneWidget);
  });

  testWidgets('renders text button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'TextBtn',
            type: DesignButtonType.text,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('TextBtn'), findsOneWidget);
  });

  testWidgets('triggers onPressed when enabled', (WidgetTester tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'TapMe',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('TapMe'));
    await tester.pump();

    expect(tapped, true);
  });

  testWidgets('does not trigger onPressed when disabled', (
    WidgetTester tester,
  ) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            text: 'Disabled',
            enabled: false,
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Disabled'));
    await tester.pump();

    expect(tapped, false);
  });

  testWidgets('applies correct size for mini button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: DesignButton(
              text: 'Mini',
              size: DesignButtonSize.mini,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final style = button.style;
    final resolvedSize = style?.minimumSize?.resolve(
      {},
    ); // resolve MaterialState
    expect(resolvedSize?.width, 72);
  });

  testWidgets('applies correct size for large button', (
    WidgetTester tester,
  ) async {
    final testWidth = 300.0;

    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: Size(testWidth, 400)),
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: DesignButton(
                text: 'Large',
                size: DesignButtonSize.large,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final style = button.style;
    final resolvedSize = style?.minimumSize?.resolve(
      {},
    ); // resolve MaterialState
    expect(resolvedSize?.width, 300);
  });

  testWidgets('should render custom child widget', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignButton(
            child: (color, style) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  const SizedBox(width: 16),
                  Text("Add"),
                ],
              );
            },
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
  });
}
