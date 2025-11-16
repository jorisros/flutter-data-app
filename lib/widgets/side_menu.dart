
import 'package:flutter/material.dart';
import 'package:myapp/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final appConfig = appProvider.appConfig;

    if (appConfig == null) {
      return const Drawer(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Drawer(
      child: ListView(
        children: appConfig.grid.map((grid) {
          return ListTile(
            title: Text(grid.name),
            onTap: () {
              appProvider.setSelectedGrid(grid);
              Navigator.pop(context); // Close the drawer
            },
          );
        }).toList(),
      ),
    );
  }
}
