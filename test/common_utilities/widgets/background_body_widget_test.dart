import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BackgroundBodyWidget widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BackgroundBodyWidget(
            child: Container(
              key: Key('testChildKey'), // Opcional: agrega una clave para encontrar el hijo
              child: Text('Test Child'),
            ),
          ),
        ),
      ),
    );

    // Find the BackgroundBodyWidget by its key or any other means if you prefer.
    final backgroundBodyFinder = find.byType(BackgroundBodyWidget);

    // Verify that the BackgroundBodyWidget is displayed.
    expect(
      backgroundBodyFinder,
      findsOneWidget,
      reason: 'BackgroundBodyWidget should be displayed',
    );

    // Find the child widget inside BackgroundBodyWidget.
    final childFinder = find.byKey(Key('testChildKey'));

    // Verify that the child widget is displayed with the correct text.
    expect(
      childFinder,
      findsOneWidget,
      reason: 'Child widget should be displayed',
    );
  });
}
