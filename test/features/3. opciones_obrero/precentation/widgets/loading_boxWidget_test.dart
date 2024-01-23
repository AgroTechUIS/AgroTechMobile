import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoadingBoxWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
          home: Scaffold(
        body: LoadingBoxWidget(
          child: SizedBox(
            height: 10,
            width: 10,
          ),
        ),
      )),
    );

    final barChartFinder = find.byType(LoadingBoxWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'LoadingBoxWidget should be displayed',
    );
  });
}
