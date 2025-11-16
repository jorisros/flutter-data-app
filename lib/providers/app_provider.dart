
import 'package:flutter/material.dart';
import 'package:myapp/models/app_config.dart';
import 'package:myapp/services/json_service.dart';

class AppProvider with ChangeNotifier {
  AppConfig? _appConfig;
  Grid? _selectedGrid;

  AppConfig? get appConfig => _appConfig;
  Grid? get selectedGrid => _selectedGrid;

  final JsonService _jsonService = JsonService();

  Future<void> loadConfig() async {
    _appConfig = await _jsonService.loadConfig();
    notifyListeners();
  }

  void setSelectedGrid(Grid grid) {
    _selectedGrid = grid;
    notifyListeners();
  }
}
