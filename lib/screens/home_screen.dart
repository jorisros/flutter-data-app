import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_service.dart';
import 'package:myapp/providers/app_provider.dart';
import 'package:myapp/widgets/dynamic_form.dart';
import 'package:myapp/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).loadConfig();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic App'),
        actions: [
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
