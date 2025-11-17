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
          // No need to await here, let it load in the background
          selectDashboard(_dashboards!.first);
        }
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectDashboard(Map<String, dynamic> dashboardData) {
    final dashboard = Dashboard.fromJson(dashboardData);

    // Create a lookup map for entity columns
    final entityColumnMap = <String, String>{};
    for (var entity in dashboard.entities) {
      for (var column in entity.columns) {
        entityColumnMap[column.id] = column.restName;
      }
    }

    // Denormalize the grid columns
    for (var grid in dashboard.grids) {
      for (var column in grid.columns) {
        column.field = entityColumnMap[column.columnId] ?? '';
      }
    }

    _selectedDashboard = dashboard;

    // Notify listeners immediately so the UI can rebuild with the selected dashboard
    notifyListeners();

    // Now, load the grid data in the background
    if (_selectedDashboard!.grids.isNotEmpty) {
      selectGrid(_selectedDashboard!.grids.first);
    } else {
      _selectedGrid = null;
      _gridData = null;
      // Notify again in case there are no grids
      notifyListeners();
    }
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
