import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/actividad_cultivo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ButtonDateWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: ActCultivoPage(),
      )),
    );

    final barChartFinder = find.byType(ActCultivoPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'ButtonDateWidget should be displayed',
    );
  });
}
