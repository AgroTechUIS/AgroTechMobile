import 'package:agrotech/common_utilities/widgets/text_in_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextInLineWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextInLineWidget(''),
        ),
      ),
    );

    final barChartFinder = find.byType(TextInLineWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'TextInLineWidget should be displayed',
    );
  });
}
