import 'package:agrotech/features/1.login/presentation/widgets/Login_offline_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginOfflineView widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(child: LoginOfflineView()),
      ),
    );

    final barChartFinder = find.byType(LoginOfflineView);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'LoginOfflineView should be displayed',
    );
  });
}
