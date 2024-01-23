import 'package:agrotech/features/3.opciones_supervisor/presentation/3.2.informe_historico/informe_historico_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.3.balance_financiero/informe_financiero_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InformeFinancieroPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: InformeFinancieroPage(),
      )),
    );

    final barChartFinder = find.byType(InformeFinancieroPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'InformeFinancieroPage should be displayed',
    );
  });
}
