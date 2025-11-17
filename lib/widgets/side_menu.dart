import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/app_provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final appConfig = appProvider.appConfig;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu'),
          ),
          if (appConfig != null)
            ...appConfig.grid.map((grid) {
              return ListTile(
                title: Text(grid.name),
                onTap: () {
                  appProvider.setSelectedGrid(grid);
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          const Divider(),
          if (appProvider.dashboards.length > 1)
            ListTile(
              title: DropdownButton<String>(
                isExpanded: true,
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
            ),
        ],
      ),
    );
  }
}
