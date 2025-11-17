import 'package:flutter/material.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          final dashboard = dashboardProvider.selectedDashboard;

          if (dashboard == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  dashboard.settings.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                  ),
                ),
              ),
              ...dashboard.grids.map((grid) {
                return ListTile(
                  title: Text(grid.name),
                  onTap: () async {
                    await dashboardProvider.selectGrid(grid);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
