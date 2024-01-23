import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/button_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ButtonDateWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: ButtonDateWidget(text: '', onTap: () {}),
      )),
    );

    final barChartFinder = find.byType(ButtonDateWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'ButtonDateWidget should be displayed',
    );
  });
}
