import 'package:flutter/material.dart';
import 'package:organiseyou/models/dashboard_model.dart';
import 'package:organiseyou/models/dashboard_service.dart';
import 'package:organiseyou/models/grid_service.dart';

class DashboardProvider with ChangeNotifier {
  final DashboardService _dashboardService;

  DashboardProvider(this._dashboardService);

  List<dynamic>? _dashboards;
  Dashboard? _selectedDashboard;
  Grid? _selectedGrid;
  List<dynamic>? _gridData;
  bool _isLoading = false;

  List<dynamic>? get dashboards => _dashboards;
  Dashboard? get selectedDashboard => _selectedDashboard;
  Grid? get selectedGrid => _selectedGrid;
  List<dynamic>? get gridData => _gridData;
  bool get isLoading => _isLoading;

  Future<void> loadDashboards() async {
    _isLoading = true;
    notifyListeners();
    try {
      _dashboards = await _dashboardService.getDashboards();
      if (_dashboards != null && _dashboards!.isNotEmpty) {
        if (_dashboards!.length == 1) {
          await selectDashboard(_dashboards!.first);
        }
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> selectDashboard(Map<String, dynamic> dashboardData) async {
    _selectedDashboard = Dashboard.fromJson(dashboardData);
    if (_selectedDashboard!.grids.isNotEmpty) {
      await selectGrid(_selectedDashboard!.grids.first);
    } else {
      _selectedGrid = null;
      _gridData = null;
    }
    notifyListeners();
  }

  Future<void> selectGrid(Grid grid) async {
    _selectedGrid = grid;
    _isLoading = true;
    _gridData = null; // Clear previous data
    notifyListeners();
    try {
      _gridData = await GridService().getGridData(grid.id);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
