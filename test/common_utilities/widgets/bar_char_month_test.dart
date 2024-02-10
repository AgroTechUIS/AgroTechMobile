import 'package:agrotech/common_utilities/widgets/bar_chart_month.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BarChartMonth widget test', (WidgetTester tester) async {
    final List<PointChartModel> testPoints = [
      PointChartModel(x: 1, y: 5, z: 10),
      PointChartModel(x: 2, y: 7, z: 8),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BarChartMonth(testPoints),
        ),
      ),
    );

    final barChartFinder = find.byType(BarChartMonth);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'BarChartHora should be displayed',
    );
  });
}
