// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:organiseyou/main.dart';

void main() {
  testWidgets('Renders dashboard and shows data table', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Expect to see the app bar title.
    expect(find.text('Dashboard'), findsOneWidget);

    // Expect to see a loading indicator initially.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the dashboard to finish loading.
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Expect to see the data table.
    expect(find.byType(DataTable), findsOneWidget);

    // Expect to not see the loading indicator anymore.
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Expect to see the title of the data table.
    expect(find.text('Users'), findsOneWidget);
  });
}
