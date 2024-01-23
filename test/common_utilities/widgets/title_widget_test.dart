import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TitleWidget widget test', (WidgetTester tester) async {
    // Define el texto que se mostrará en el TitleWidget.
    const String titleText = 'Título de prueba';

    // Construye nuestro widget y activa un frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: TitleWidget(titleText),
      ),
    );

    // Busca el TitleWidget por su tipo o cualquier otro método que prefieras.
    final titleWidgetFinder = find.byType(TitleWidget);

    // Verifica que el TitleWidget esté siendo mostrado.
    expect(
      titleWidgetFinder,
      findsOneWidget,
      reason: 'TitleWidget debe estar siendo mostrado',
    );

    // Verifica que el texto del título se muestre correctamente en el widget.
    expect(
      find.text(titleText),
      findsOneWidget,
      reason: 'El texto del título debe estar siendo mostrado',
    );

    // Verifica el estilo del texto del título, como el tamaño de fuente y el color.
    final textWidget = tester.widget<Text>(
      find.text(titleText),
    );
    expect(
      textWidget.style?.fontSize,
      20,
      reason: 'El tamaño de fuente del texto del título debe ser 20',
    );
    expect(
      textWidget.style?.color,
      colors.textColor,
      reason: 'El color del texto del título debe coincidir con el color de la aplicación',
    );

    // Puedes agregar más casos de prueba para verificar otros aspectos del TitleWidget si es necesario.
  });
}
