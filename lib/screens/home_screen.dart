import 'package:flutter/material.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const SideMenu(),
      body: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          if (dashboardProvider.selectedGrid == null) {
            return const Center(
                child: Text('Please select a grid from the side menu.'));
          }
          return Center(
            child: Text('Content for ${dashboardProvider.selectedGrid!.name}'),
          );
        },
      ),
    );
  }
}
