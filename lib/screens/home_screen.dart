import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../auth_service.dart';
import 'package:organiseyou/providers/app_provider.dart';
import 'package:organiseyou/widgets/dynamic_form.dart';
import 'package:organiseyou/widgets/side_menu.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        Provider.of<AppProvider>(context, listen: false).loadDashboards();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appProvider.appConfig?.settings.name ?? 'Dynamic App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
            },
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (provider.appConfig == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.selectedGrid == null) {
            return const Center(
              child: Text('Select an item from the menu'),
            );
          }

          // Find the form to be displayed. For now, we'll use the formNew if it exists.
          final formId = provider.selectedGrid!.formNew;
          if (formId == null) {
            return const Center(
              child: Text('No new form defined for this grid.'),
            );
          }

          final form = provider.appConfig!.forms.firstWhereOrNull((f) => f.id == formId);

          if (form == null) {
            return const Center(
              child: Text('Form not found.'),
            );
          }

          return DynamicForm(form: form);
        },
      ),
    );
  }
}
