import 'package:agrotech/common_utilities/widgets/filter_one_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FilterOneDate widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterOneDate(onSelect: (DateTime date) {}),
        ),
      ),
    );

    final barChartFinder = find.byType(FilterOneDate);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'FilterOneDate should be displayed',
    );
  });
}
