import 'package:agrotech/features/1.login/presentation/login_state.dart';
import 'package:agrotech/features/2.home/presentation/widgets/dni_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DniWidget widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DniWidget(
            stateLogin: LoginState(),
          ),
        ),
      ),
    );

    final barChartFinder = find.byType(DniWidget);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'DniWidget should be displayed',
    );
  });
}
