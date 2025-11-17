import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/auth/auth_service.dart';
import 'package:organiseyou/providers/app_provider.dart';
import 'package:organiseyou/main.dart';
import 'package:organiseyou/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSettingsService extends SettingsService {
  @override
  Future<String> getBackendUrl() async {
    return 'https://organiseyou.ddev.site/api';
  }
}

void main() {
  testWidgets('Login and navigate to grid content', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final settingsService = MockSettingsService();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<SettingsService>(create: (_) => settingsService),
          ChangeNotifierProvider<AuthService>(
            create: (_) => AuthService(settingsService),
          ),
          ChangeNotifierProvider<AppProvider>(
            create: (_) => AppProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that the login screen is shown initially by checking for the AppBar title.
    expect(find.descendant(of: find.byType(AppBar), matching: find.text('Login')), findsOneWidget);

    // Enter username and password.
    await tester.enterText(find.byType(TextField).at(0), 'testuser');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the login button.
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump(); // Start the login process
    await tester.pumpAndSettle(); // Let the future complete and animations settle

    // The app should now be showing the home screen.
    expect(find.text('Dashboard'), findsOneWidget);

    // Open the side menu.
    await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
    await tester.pumpAndSettle();

    // Tap on the first grid.
    await tester.tap(find.text('Grid 1'));
    await tester.pumpAndSettle();

    // Verify that the content for the selected grid is displayed.
    expect(find.text('Content for Grid 1'), findsOneWidget);
  });
}
