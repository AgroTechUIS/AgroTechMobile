import 'package:agrotech/common_utilities/widgets/bar_chart_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BarChartWidget widget test', (WidgetTester tester) async {
    final List<PointChartModel> testPoints = [
      PointChartModel(x: 1, y: 5, z: 10),
      PointChartModel(x: 2, y: 7, z: 8),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                BarChartWidget(
                  listPoints: testPoints,
                  chartType: ChartType.balance,
                  title: 'Test Chart',
                ),
                BarChartWidget(
                  listPoints: testPoints,
                  chartType: ChartType.hora,
                  title: 'Test Chart',
                ),
                BarChartWidget(
                  listPoints: testPoints,
                  chartType: ChartType.month,
                  title: 'Test Chart',
                ),
                BarChartWidget(
                  listPoints: testPoints,
                  chartType: ChartType.utilidad,
                  title: 'Test Chart',
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final barChartFinder = find.byType(BarChartWidget);

    expect(
      barChartFinder,
      findsWidgets,
      reason: 'BarChartWidget should be displayed',
    );
  });
}
