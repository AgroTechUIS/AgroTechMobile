import 'package:agrotech/common_utilities/widgets/progress_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProgressBarWidget widget test', (WidgetTester tester) async {
    // Define the text for the ProgressBarWidget.
    const String testText = 'Test Progress';

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: const [
              ProgressBarWidget(testText),
            ],
          ),
        ),
      ),
    );

    // Find the ProgressBarWidget by its key or any other means if you prefer.
    final progressBarFinder = find.byType(ProgressBarWidget);

    // Verify that the ProgressBarWidget is displayed.
    expect(
      progressBarFinder,
      findsOneWidget,
      reason: 'ProgressBarWidget should be displayed',
    );

    // Verify that the text is rendered correctly.
    expect(find.text(testText), findsOneWidget);
  });
}
