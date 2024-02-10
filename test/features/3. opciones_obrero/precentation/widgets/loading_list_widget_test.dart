import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoadingListWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
          home: Scaffold(
        body: LoadingListWidget(),
      )),
    );

    final barChartFinder = find.byType(LoadingListWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'LoadingListWidget should be displayed',
    );
  });
}
