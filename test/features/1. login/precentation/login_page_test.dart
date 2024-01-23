import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginPage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(child: LoginPage()),
      ),
    );

    final barChartFinder = find.byType(LoginPage);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'LoginPage should be displayed',
    );
  });
}
