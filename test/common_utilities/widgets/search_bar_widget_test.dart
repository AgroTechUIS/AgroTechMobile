import 'package:agrotech/common_utilities/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchBarWidget widget test', (WidgetTester tester) async {
    // Define the initial search text.
    const String initialSearchText = 'Initial Search Text';

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SearchBarWidget(searchText: initialSearchText)),
      ),
    );

    // Find the SearchBarWidget by its key or any other means if you prefer.
    final searchBarFinder = find.byType(SearchBarWidget);

    // Verify that the SearchBarWidget is displayed.
    expect(
      searchBarFinder,
      findsOneWidget,
      reason: 'SearchBarWidget should be displayed',
    );

    // Verify that the initial search text is displayed in the TextField.
    expect(find.text(initialSearchText), findsOneWidget);
  });
}
