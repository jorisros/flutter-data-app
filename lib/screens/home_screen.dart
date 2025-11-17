import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/providers/app_provider.dart';
import 'package:organiseyou/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).getDashboards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const SideMenu(),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          if (appProvider.dashboard == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (appProvider.selectedGrid == null) {
            return const Center(child: Text('Please select a grid from the side menu.'));
          }
          return Center(
            child: Text('Content for ${appProvider.selectedGrid!.name}'),
          );
        },
      ),
    );
  }
}
