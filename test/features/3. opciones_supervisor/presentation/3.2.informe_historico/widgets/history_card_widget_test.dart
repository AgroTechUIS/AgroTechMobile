import 'package:agrotech/features/3.opciones_supervisor/presentation/3.2.informe_historico/widgets/history_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HistoryCardWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: HistoryCardWidget(title: '', subtitle: '', content: ['']),
      )),
    );

    final barChartFinder = find.byType(HistoryCardWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'HistoryCardWidget should be displayed',
    );
  });
}
