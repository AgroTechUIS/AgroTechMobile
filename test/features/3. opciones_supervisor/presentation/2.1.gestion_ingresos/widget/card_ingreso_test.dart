import 'package:agrotech/features/3.opciones_supervisor/presentation/2.1.gestion_ingresos/widget/card_ingreso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AsigCultivoPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: CardMovementWidget(
          numeroFactura: '01',
          valor: 1000,
        ),
      )),
    );

    final barChartFinder = find.byType(CardMovementWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'AsigCultivoPage should be displayed',
    );
  });
}
