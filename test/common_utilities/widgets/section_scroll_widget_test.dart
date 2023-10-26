import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SectionScrollWidget widget test', (WidgetTester tester) async {
    // Define a list of children widgets to be displayed in the SectionScrollWidget.
    final List<Widget> children = [
      Text('Child 1'),
      Text('Child 2'),
      Text('Child 3'),
    ];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              SectionScrollWidget(
                children: children,
                showSearch: true, // You can adjust this value as needed for testing.
              ),
            ],
          ),
        ),
      ),
    );

    // Find the SectionScrollWidget by its key or any other means if you prefer.
    final sectionScrollFinder = find.byType(SectionScrollWidget);

    // Verify that the SectionScrollWidget is displayed.
    expect(
      sectionScrollFinder,
      findsOneWidget,
      reason: 'SectionScrollWidget should be displayed',
    );

    // Verify that the children widgets are displayed inside the SectionScrollWidget.
    for (final child in children) {
      expect(find.byWidget(child), findsOneWidget);
    }
  });
}
