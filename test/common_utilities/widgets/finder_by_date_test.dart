import 'package:agrotech/common_utilities/widgets/filter_by_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FilterByDate widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FilterByDate(),
        ),
      ),
    );

    final barChartFinder = find.byType(FilterByDate);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'BarChartHora should be displayed',
    );
  });
}
