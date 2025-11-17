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
          final grid = dashboardProvider.selectedGrid;

          if (dashboardProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (grid == null) {
            return const Center(
                child: Text('Please select a grid from the side menu.'));
          }

          final gridData = dashboardProvider.gridData;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: grid.columns.map((column) {
                return DataColumn(label: Text(column.label));
              }).toList(),
              rows: gridData?.map((row) {
                    return DataRow(
                      cells: grid.columns.map((column) {
                        return DataCell(Text(row[column.field]?.toString() ?? ''));
                      }).toList(),
                    );
                  }).toList() ??
                  [],
            ),
          );
        },
      ),
    );
  }
}
