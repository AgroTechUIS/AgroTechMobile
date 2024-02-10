import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/crear_actividad_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CrearActividadView widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
          child: MaterialApp(
        home: CrearActividadView(),
      )),
    );

    final barChartFinder = find.byType(CrearActividadView);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'CrearActividadView should be displayed',
    );
  });
}
