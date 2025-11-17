import 'package:flutter/material.dart';
import 'package:organiseyou/models/dashboard.dart';
import 'package:organiseyou/models/grid.dart';

class AppProvider extends ChangeNotifier {
  Dashboard? _dashboard;
  Grid? _selectedGrid;

  Dashboard? get dashboard => _dashboard;
  Grid? get selectedGrid => _selectedGrid;

  Future<void> getDashboards() async {
    // In a real app, you'd have network requests and error handling here
    await Future.delayed(const Duration(seconds: 1));
    _dashboard = Dashboard(
      id: '1',
      name: 'My Dashboard',
      grids: [
        Grid(id: '1', name: 'Grid 1'),
        Grid(id: '2', name: 'Grid 2'),
        Grid(id: '3', name: 'Grid 3'),
      ],
    );
    notifyListeners();
  }

  void selectGrid(Grid grid) {
    _selectedGrid = grid;
    notifyListeners();
  }
}
