import 'package:agrotech/features/3.opciones_supervisor/presentation/2.2.gestion_egresos/gestion_egresos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GestionEgresos widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: GestionEgresos(),
      )),
    );

    final barChartFinder = find.byType(GestionEgresos);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'GestionEgresos should be displayed',
    );
  });
}
