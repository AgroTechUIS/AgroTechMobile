import 'package:agrotech/common_utilities/widgets/filter_by_text_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FilterByTextDateWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FilterByTextDateWidget(),
        ),
      ),
    );

    final barChartFinder = find.byType(FilterByTextDateWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'BarChartHora should be displayed',
    );
  });
}
