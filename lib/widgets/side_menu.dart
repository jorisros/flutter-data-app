import 'package:flutter/material.dart';
import 'package:organiseyou/models/dashboard_model.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          if (dashboardProvider.selectedDashboard == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Grid> grids = (dashboardProvider.selectedDashboard['grids'] as List)
              .map((grid) => Grid.fromJson(grid))
              .toList();

          return ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Text(
                  dashboardProvider.selectedDashboard['settings']['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ...grids.map((grid) {
                return ListTile(
                  title: Text(grid.name),
                  onTap: () {
                    dashboardProvider.selectGrid(grid);
                    Navigator.pop(context);
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
