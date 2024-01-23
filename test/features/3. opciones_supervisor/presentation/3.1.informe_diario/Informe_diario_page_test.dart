import 'package:agrotech/features/3.opciones_supervisor/presentation/3.1.informe_diario/Informe_diario_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InformeDiarioPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: InformeDiarioPage(),
      )),
    );

    final barChartFinder = find.byType(InformeDiarioPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'InformeDiarioPage should be displayed',
    );
  });
}
