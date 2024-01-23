import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/button_date_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/data_activity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DataActivity widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: DataActivity(actividad: ActivityModel()),
      )),
    );

    final barChartFinder = find.byType(DataActivity);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'DataActivity should be displayed',
    );
  });
}
