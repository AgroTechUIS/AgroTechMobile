import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ErrorScreen widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ErrorScreen(),
      ),
    );

    // Find the ErrorScreen widget by its key or any other means if you prefer.
    final errorScreenFinder = find.byType(ErrorScreen);

    // Verify that the ErrorScreen widget is displayed.
    expect(
      errorScreenFinder,
      findsOneWidget,
      reason: 'ErrorScreen should be displayed',
    );

    // Verify that the error message and button are rendered correctly.
    expect(find.text('Perdiste la conexion a internet'), findsOneWidget);
    expect(find.text('Intentalo mas tarde'), findsOneWidget);
    expect(find.text('Vlover a login'), findsOneWidget);
  });
}
