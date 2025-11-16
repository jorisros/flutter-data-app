import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_service.dart';
import 'package:myapp/providers/app_provider.dart';
import 'package:myapp/widgets/dynamic_form.dart';
import 'package:myapp/widgets/side_menu.dart';
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
          if (appProvider.dashboards.length > 1)
            DropdownButton<String>(
              value: appProvider.selectedDashboard?.id,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  final dashboard = appProvider.dashboards.firstWhere((d) => d.id == newValue);
                  appProvider.setSelectedDashboard(dashboard);
                }
              },
              items: appProvider.dashboards.map<DropdownMenuItem<String>>((dashboard) {
                return DropdownMenuItem<String>(
                  value: dashboard.id,
                  child: Text(dashboard.name),
                );
              }).toList(),
            ),
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
          return DynamicForm(grid: provider.selectedGrid!);
        },
      ),
    );
  }
}
