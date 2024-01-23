import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SubtitleWidget widget test', (WidgetTester tester) async {
    // Define el texto que se mostrará en el SubtitleWidget.
    const String subtitleText = 'Subtítulo de prueba';

    // Construye nuestro widget y activa un frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: SubtitleWidget(subtitleText),
      ),
    );

    // Busca el SubtitleWidget por su tipo o cualquier otro método que prefieras.
    final subtitleWidgetFinder = find.byType(SubtitleWidget);

    // Verifica que el SubtitleWidget esté siendo mostrado.
    expect(
      subtitleWidgetFinder,
      findsOneWidget,
      reason: 'SubtitleWidget debe estar siendo mostrado',
    );

    // Verifica que el texto del subtítulo se muestre correctamente en el widget.
    expect(
      find.text(subtitleText),
      findsOneWidget,
      reason: 'El texto del subtítulo debe estar siendo mostrado',
    );

    // Verifica el estilo del texto del subtítulo, como el tamaño de fuente y el color.
    final textWidget = tester.widget<Text>(
      find.text(subtitleText),
    );
    expect(
      textWidget.style?.fontSize,
      20,
      reason: 'El tamaño de fuente del texto del subtítulo debe ser 20',
    );
    expect(
      textWidget.style?.color,
      colors.textColor,
      reason: 'El color del texto del subtítulo debe coincidir con el color de la aplicación',
    );
    expect(
      textWidget.style?.fontWeight,
      FontWeight.bold,
      reason: 'El peso de fuente del texto del subtítulo debe ser FontWeight.bold',
    );

    // Puedes agregar más casos de prueba para verificar otros aspectos del SubtitleWidget si es necesario.
  });
}
