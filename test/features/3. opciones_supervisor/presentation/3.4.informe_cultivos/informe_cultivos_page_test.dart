import 'package:agrotech/features/3.opciones_supervisor/presentation/3.4.informe_cultivos/informe_cultivos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InformeCultivosPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: InformeCultivosPage(),
      )),
    );

    final barChartFinder = find.byType(InformeCultivosPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'InformeCultivosPage should be displayed',
    );
  });
}
