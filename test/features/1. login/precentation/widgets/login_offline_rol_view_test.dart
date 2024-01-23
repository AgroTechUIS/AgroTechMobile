import 'package:agrotech/features/1.login/presentation/widgets/Login_offline_rol_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginOfflineRolView widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(child: LoginOfflineRolView()),
      ),
    );

    final barChartFinder = find.byType(LoginOfflineRolView);

    expect(
      barChartFinder,
      findsOneWidget,
      reason: 'LoginOfflineRolView should be displayed',
    );
  });
}
