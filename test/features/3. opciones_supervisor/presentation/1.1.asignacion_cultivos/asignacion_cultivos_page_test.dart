import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/asignacion_cultivos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AsigCultivoPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: AsigCultivoPage(),
      )),
    );

    final barChartFinder = find.byType(AsigCultivoPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'AsigCultivoPage should be displayed',
    );
  });
}
