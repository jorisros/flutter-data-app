import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:organiseyou/main.dart';
import 'package:organiseyou/models/dashboard_service.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([DashboardService])
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final mockDashboardService = MockDashboardService();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => DashboardProvider(mockDashboardService),
          ),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
