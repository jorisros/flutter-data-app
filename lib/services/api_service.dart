import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/auth_service.dart';
import 'package:myapp/models/app_config.dart';
import 'package:myapp/models/dashboard.dart';
import 'package:myapp/settings_service.dart';
import 'dart:developer' as developer;

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

    final client = http.Client();
    try {
      final request = http.Request('GET', Uri.parse('$backendUrl/dashboards'));
      request.headers['Authorization'] = 'Bearer $token';
      request.followRedirects = false;

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode >= 300 && streamedResponse.statusCode < 400) {
        final location = streamedResponse.headers['location'];
        developer.log('Backend sent a redirect to: $location while fetching dashboards.', name: 'api.service');
        return [];
      }

      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Dashboard.fromJson(json)).toList();
      }
      return [];
    } catch (e, s) {
      developer.log('Error in getDashboards', name: 'api.service', error: e, stackTrace: s);
      return [];
    } finally {
      client.close();
    }
  }

  Future<AppConfig?> getDashboardConfig(String dashboardId) async {
    final token = await _authService.getToken();
    final backendUrl = await _settingsService.getBackendUrl();

    if (token == null) {
      return null;
    }

    final client = http.Client();
    try {
      final request = http.Request(
        'GET',
        Uri.parse('$backendUrl/dashboard/$dashboardId'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.followRedirects = false;

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode >= 300 && streamedResponse.statusCode < 400) {
        final location = streamedResponse.headers['location'];
        developer.log('Backend sent a redirect to: $location for dashboard $dashboardId', name: 'api.service');
        return null;
      }

      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return AppConfig.fromJson(json.decode(response.body));
      }
      return null;
    } catch (e, s) {
      developer.log('Error in getDashboardConfig', name: 'api.service', error: e, stackTrace: s);
      return null;
    } finally {
      client.close();
    }
  }

  Future<AppConfig?> getAppConfig() async {
    final token = await _authService.getToken();
    final backendUrl = await _settingsService.getBackendUrl();

    if (token == null) {
      return null;
    }

    final client = http.Client();
    try {
      final request = http.Request('GET', Uri.parse('$backendUrl/config'));
      request.headers['Authorization'] = 'Bearer $token';
      request.followRedirects = false;

      final streamedResponse = await client.send(request);

      if (streamedResponse.statusCode >= 300 && streamedResponse.statusCode < 400) {
        final location = streamedResponse.headers['location'];
        developer.log('Backend sent a redirect to: $location while fetching app config.', name: 'api.service');
        return null;
      }

      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return AppConfig.fromJson(json.decode(response.body));
      }
      return null;
    } catch (e, s) {
      developer.log('Error in getAppConfig', name: 'api.service', error: e, stackTrace: s);
      return null;
    } finally {
      client.close();
    }
  }
}
