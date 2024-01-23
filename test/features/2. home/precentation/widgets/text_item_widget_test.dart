import 'package:agrotech/features/2.home/presentation/widgets/text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextItemWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: const [
              TextItemWidget(title: '', text: ''),
            ],
          ),
        ),
      ),
    );

    final barChartFinder = find.byType(TextItemWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'TextItemWidget should be displayed',
    );
  });
}
