import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MiniOptionWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MiniOptionWidget(
            title: '',
            iconRoute: 'assets/contract.svg',
            onTap: () {},
          ),
        ),
      ),
    );

    final barChartFinder = find.byType(MiniOptionWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'MiniOptionWidget should be displayed',
    );
  });
}
