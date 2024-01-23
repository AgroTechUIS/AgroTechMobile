import 'package:agrotech/features/3.opciones_supervisor/presentation/2.1.gestion_ingresos/gestion_ingresos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GestionIngresos widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: GestionIngresos(),
      )),
    );

    final barChartFinder = find.byType(GestionIngresos);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'GestionIngresos should be displayed',
    );
  });
}
