import 'package:agrotech/features/2.home/presentation/widgets/supervisor_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SupervisorOptions widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: const [
              SupervisorOptions(),
            ],
          )),
        ),
      ),
    );

    final barChartFinder = find.byType(SupervisorOptions);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'SupervisorOptions should be displayed',
    );
  });
}
