import 'package:agrotech/common_utilities/widgets/bar_chart_hora.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/point_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BarChartHora widget test', (WidgetTester tester) async {
    // Create a list of PointChartModel for testing.
    final List<PointChartModel> testPoints = [
      PointChartModel(x: 1, y: 5, z: 10),
      PointChartModel(x: 2, y: 7, z: 8),
      // Add more test data as needed.
    ];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BarChartHora(testPoints),
        ),
      ),
    );

    // Find the BarChartHora widget by its key or any other means if you prefer.
    final barChartFinder = find.byType(BarChartHora);

    // Verify that the BarChartHora widget is displayed.
    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'BarChartHora should be displayed',
    );
  });
}
