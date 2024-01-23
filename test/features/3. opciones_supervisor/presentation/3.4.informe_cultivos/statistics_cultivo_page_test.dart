import 'package:agrotech/features/3.opciones_supervisor/presentation/3.4.informe_cultivos/statistics_cultivo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StadisticCultivoPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: StadisticCultivoPage(idCultivo: ''),
      )),
    );

    final barChartFinder = find.byType(StadisticCultivoPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'StadisticCultivoPage should be displayed',
    );
  });
}
