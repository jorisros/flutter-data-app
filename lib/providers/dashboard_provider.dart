import 'package:flutter/material.dart';
import 'package:organiseyou/models/dashboard_model.dart';
import 'package:organiseyou/models/dashboard_service.dart';

class DashboardProvider with ChangeNotifier {
  final DashboardService _dashboardService;
  List<dynamic>? _dashboards;
  dynamic _selectedDashboard;
  Grid? _selectedGrid;

  DashboardProvider(this._dashboardService);

  List<dynamic>? get dashboards => _dashboards;
  dynamic get selectedDashboard => _selectedDashboard;
  Grid? get selectedGrid => _selectedGrid;

  Future<void> loadDashboards() async {
    try {
      _dashboards = await _dashboardService.getDashboards();
      if (_dashboards != null && _dashboards!.length == 1) {
        _selectedDashboard = _dashboards!.first;
      }
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  void selectDashboard(dynamic dashboard) {
    _selectedDashboard = dashboard;
    _selectedGrid = null;
    notifyListeners();
  }

  void selectGrid(Grid grid) {
    _selectedGrid = grid;
    notifyListeners();
  }
}
