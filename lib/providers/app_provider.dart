import 'package:flutter/material.dart';
import 'package:myapp/models/app_config.dart';
import 'package:myapp/models/dashboard.dart';
import 'package:myapp/services/api_service.dart';

class AppProvider with ChangeNotifier {
  ApiService _apiService;

  AppConfig? _appConfig;
  AppConfig? get appConfig => _appConfig;

  List<Dashboard> _dashboards = [];
  List<Dashboard> get dashboards => _dashboards;

  Dashboard? _selectedDashboard;
  Dashboard? get selectedDashboard => _selectedDashboard;

  Grid? _selectedGrid;
  Grid? get selectedGrid => _selectedGrid;

  AppProvider(this._apiService);

  void updateApiService(ApiService apiService) {
    _apiService = apiService;
  }

  Future<void> loadDashboards() async {
    _dashboards = await _apiService.getDashboards();
    if (_dashboards.length == 1) {
      await setSelectedDashboard(_dashboards.first);
    }
    notifyListeners();
  }

  Future<void> setSelectedDashboard(Dashboard dashboard) async {
    _selectedDashboard = dashboard;
    _appConfig = await _apiService.getDashboardConfig(dashboard.id);
    notifyListeners();
  }

  void setSelectedGrid(Grid grid) {
    _selectedGrid = grid;
    notifyListeners();
  }
}
