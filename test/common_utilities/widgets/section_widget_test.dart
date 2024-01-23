import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SectionWidget widget test', (WidgetTester tester) async {
    // Define a list of children widgets to be displayed in the SectionWidget.
    final List<Widget> children = [
      const Text('Child 1'),
      const Text('Child 2'),
      const Text('Child 3'),
    ];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: SectionWidget(
          background: Colors.blue, // You can adjust this value as needed for testing.
          padding: const EdgeInsets.all(10),
          children: children, // You can adjust this value as needed for testing.
        ),
      ),
    );

    // Find the SectionWidget by its key or any other means if you prefer.
    final sectionWidgetFinder = find.byType(SectionWidget);

    // Verify that the SectionWidget is displayed.
    expect(
      sectionWidgetFinder,
      findsOneWidget,
      reason: 'SectionWidget should be displayed',
    );

    // Verify that the children widgets are displayed inside the SectionWidget.
    for (final child in children) {
      expect(find.byWidget(child), findsOneWidget);
    }
  });
}
