import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HeaderPageWidget widget test', (WidgetTester tester) async {
    // Define the text to display in the widget.
    const String testText = 'Test Header';

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: HeaderPageWidget(testText),
      ),
    );

    // Find the HeaderPageWidget by its key or any other means if you prefer.
    final headerWidgetFinder = find.byType(HeaderPageWidget);

    // Verify that the HeaderPageWidget is displayed.
    expect(
      headerWidgetFinder,
      findsOneWidget,
      reason: 'HeaderPageWidget should be displayed',
    );

    // Verify that the test text is rendered correctly.
    expect(find.text(testText), findsOneWidget);
  });
}
