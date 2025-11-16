import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/auth_service.dart';
import 'package:myapp/models/app_config.dart';
import 'package:myapp/models/dashboard.dart';
import 'package:myapp/settings_service.dart';

class ApiService {
  final AuthService _authService;
  final SettingsService _settingsService;

  ApiService(this._authService, this._settingsService);

  Future<List<Dashboard>> getDashboards() async {
    final token = await _authService.getToken();
    final backendUrl = await _settingsService.getBackendUrl();

    if (token == null) {
      return [];
    }

    final response = await http.get(
      Uri.parse('$backendUrl/api/dashboard'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Dashboard.fromJson(json)).toList();
    }

    return [];
  }

  Future<AppConfig?> getDashboardConfig(String dashboardId) async {
    final token = await _authService.getToken();
    final backendUrl = await _settingsService.getBackendUrl();

    if (token == null) {
      return null;
    }

    final response = await http.get(
      Uri.parse('$backendUrl/api/dashboard/$dashboardId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return AppConfig.fromJson(json.decode(response.body));
    }

    return null;
  }

  Future<AppConfig?> getAppConfig() async {
    final token = await _authService.getToken();
    final backendUrl = await _settingsService.getBackendUrl();

    if (token == null) {
      return null;
    }

    final response = await http.get(
      Uri.parse('$backendUrl/api/config'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return AppConfig.fromJson(json.decode(response.body));
    }

    return null;
  }
}
