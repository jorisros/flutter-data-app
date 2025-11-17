
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/providers/app_provider.dart';
import 'package:organiseyou/models/dashboard.dart';
import 'home_screen.dart';

class DashboardSelectionScreen extends StatefulWidget {
  const DashboardSelectionScreen({super.key});

  @override
  DashboardSelectionScreenState createState() => DashboardSelectionScreenState();
}

class DashboardSelectionScreenState extends State<DashboardSelectionScreen> {
  Dashboard? _selectedDashboard;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final dashboards = appProvider.dashboards;

    if (_selectedDashboard == null && dashboards.isNotEmpty) {
      _selectedDashboard = dashboards.first;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (dashboards.isNotEmpty)
              DropdownButton<Dashboard>(
                value: _selectedDashboard,
                onChanged: (Dashboard? newValue) {
                  setState(() {
                    _selectedDashboard = newValue;
                  });
                },
                items: dashboards.map<DropdownMenuItem<Dashboard>>((Dashboard dashboard) {
                  return DropdownMenuItem<Dashboard>(
                    value: dashboard,
                    child: Text(dashboard.name),
                  );
                }).toList(),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedDashboard == null ? null : () async {
                final navigator = Navigator.of(context);
                await appProvider.setSelectedDashboard(_selectedDashboard!);
                if (mounted) {
                  navigator.pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
