import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomCardWidget widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCardWidget(
            imagenUrl: 'assets/images/imagen5.jpg',
            title: 'Test Title',
            subtitle: 'Test Subtitle',
            content: ['Content Line 1', 'Content Line 2'],
            onPressed: () {
              // Add any action you want to perform when the button is pressed.
            },
            buttonText: 'Button Text',
          ),
        ),
      ),
    );

    // Find the CustomCardWidget by its key or any other means if you prefer.
    final customCardFinder = find.byType(CustomCardWidget);

    // Verify that the CustomCardWidget is displayed.
    expect(
      customCardFinder,
      findsOneWidget,
      reason: 'CustomCardWidget should be displayed',
    );

    // Verify that the title, subtitle, and content are rendered correctly.
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Subtitle'), findsOneWidget);
    expect(find.text('Content Line 1'), findsOneWidget);
    expect(find.text('Content Line 2'), findsOneWidget);

    // Verify that the button is rendered with the correct text.
    expect(find.text('Button Text'), findsOneWidget);
  });
}
