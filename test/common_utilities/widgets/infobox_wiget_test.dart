import 'package:agrotech/common_utilities/widgets/infobox_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InfoBox widget test', (WidgetTester tester) async {
    // Define the values for the InfoBox widget.
    const String testTitle = 'Test Title';
    const String testValue = 'Test Value';

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Row(
          children: const [
            InfoBox(
              title: testTitle,
              value: testValue,
            ),
          ],
        ),
      ),
    );

    // Find the InfoBox widget by its key or any other means if you prefer.
    final infoBoxFinder = find.byType(InfoBox);

    // Verify that the InfoBox widget is displayed.
    expect(
      infoBoxFinder,
      findsOneWidget,
      reason: 'InfoBox should be displayed',
    );

    // Verify that the title and value are rendered correctly.
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testValue), findsOneWidget);
  });
}
