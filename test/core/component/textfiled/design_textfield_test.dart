import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should render label and required asterisk', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            labelText: 'Username',
            required: true,
          ),
        ),
      ),
    );
    final richText = tester.widget<RichText>(find.byType(RichText));

    expect(richText.text.toPlainText(), "Username *");
  });

  testWidgets('should render hint text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            hintText: 'Enter your username',
          ),
        ),
      ),
    );

    expect(find.text('Enter your username'), findsOneWidget);
  });

  testWidgets('should render error text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            errorText: 'Invalid input',
          ),
        ),
      ),
    );

    expect(find.text('Invalid input'), findsOneWidget);
  });

  testWidgets('should call onChanged when text changes', (tester) async {
    String? value;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            onChanged: (v) => value = v,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Hello');
    expect(value, 'Hello');
  });

  testWidgets('should call onSubmitted when text submitted', (tester) async {
    String? submittedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            onSubmitted: (v) => submittedValue = v,
          ),
        ),
      ),
    );

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // Enter some text
    await tester.enterText(find.byType(TextField), 'Hello');

    // Simulate pressing the "done" button on the keyboard
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pump(); // Rebuild after input action

    expect(submittedValue, 'Hello');
  });

  testWidgets('should toggle obscureText when suffix icon pressed', (
    tester,
  ) async {
    bool? obscureStatus;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            maxLines: 1,
            obscureText: true,
            onHideText: (v) => obscureStatus = v,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.visibility), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    expect(obscureStatus, false);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });

  testWidgets('should render prefix and suffix widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DesignTextfield(
            prefix: Icon(Icons.person),
            suffix: Icon(Icons.check),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('should apply correct borders based on type', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              DesignTextfield(type: DesignTextfieldType.outlined),
              DesignTextfield(type: DesignTextfieldType.underline),
              DesignTextfield(type: DesignTextfieldType.none),
            ],
          ),
        ),
      ),
    );

    final textFields = tester
        .widgetList<TextField>(find.byType(TextField))
        .toList();

    expect(textFields[0].decoration?.border, isA<OutlineInputBorder>());
    expect(textFields[1].decoration?.border, isA<UnderlineInputBorder>());
    expect(textFields[2].decoration?.border, InputBorder.none);
  });

  testWidgets('should respect enabled and disabled state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              DesignTextfield(enabled: true),
              DesignTextfield(enabled: false),
            ],
          ),
        ),
      ),
    );

    final textFields = tester
        .widgetList<TextField>(find.byType(TextField))
        .toList();
    expect(textFields[0].enabled, true);
    expect(textFields[1].enabled, false);
  });
}
