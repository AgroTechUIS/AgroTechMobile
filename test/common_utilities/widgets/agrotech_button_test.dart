import 'package:agrotech/common_utilities/widgets/agrotech_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agrotech/common_utilities/config/colors_theme.dart';

void main() {
  testWidgets('AgrotechButton widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AgrotechButton(
          text: 'Test Button',
          onPressed: () {},
        ),
      ),
    ));

    // Find the ElevatedButton widget by its key or any other means if you prefer.
    final elevatedButtonFinder = find.byType(ElevatedButton);

    // Verify that the ElevatedButton is displayed with the correct background color.
    expect(
      elevatedButtonFinder,
      findsOneWidget,
      reason: 'AgrotechButton should contain one ElevatedButton',
    );

    final elevatedButtonWidget = tester.widget<ElevatedButton>(elevatedButtonFinder);
    final buttonStyle = elevatedButtonWidget.style;

    expect(
      buttonStyle!.backgroundColor!.resolve({}),
      colors.appbar,
      reason: 'ElevatedButton should have the correct background color',
    );

    // Find the Text widget inside the ElevatedButton.
    final textFinder = find.text('Test Button');

    // Verify that the Text widget is displayed with the correct text color.
    expect(
      textFinder,
      findsOneWidget,
      reason: 'AgrotechButton should contain one Text widget with the specified text',
    );

    final textWidget = tester.widget<Text>(textFinder);

    expect(
      textWidget.style!.color,
      Colors.black,
      reason: 'Text widget should have the correct text color',
    );
  });
}
