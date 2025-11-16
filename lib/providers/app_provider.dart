import 'package:flutter/material.dart';
import 'package:myapp/models/app_config.dart';
import 'package:myapp/services/api_service.dart';

class AppProvider with ChangeNotifier {
  final ApiService _apiService;

  AppConfig? _appConfig;
  AppConfig? get appConfig => _appConfig;

  Grid? _selectedGrid;
  Grid? get selectedGrid => _selectedGrid;

  AppProvider(this._apiService);

  Future<void> loadConfig() async {
    _appConfig = await _apiService.getAppConfig();
    notifyListeners();
  }

  void setSelectedGrid(Grid grid) {
    _selectedGrid = grid;
    notifyListeners();
  }
}
