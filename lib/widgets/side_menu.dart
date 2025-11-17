import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/providers/app_provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          if (appProvider.dashboard == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Text(
                  'Grids',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ...appProvider.dashboard!.grids.map((grid) {
                return ListTile(
                  title: Text(grid.name),
                  onTap: () {
                    appProvider.selectGrid(grid);
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
