import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/auth_service.dart';
import 'package:myapp/models/app_config.dart';
import 'package:myapp/settings_service.dart';

class ApiService {
  final AuthService _authService;
  final SettingsService _settingsService;

  ApiService(this._authService, this._settingsService);

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
