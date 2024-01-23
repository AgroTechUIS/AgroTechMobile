import 'package:agrotech/features/2.home/presentation/widgets/obreros_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ObreroOptions widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: const [
              ObreroOptions(),
            ],
          )),
        ),
      ),
    );

    final barChartFinder = find.byType(ObreroOptions);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'ObreroOptions should be displayed',
    );
  });
}
