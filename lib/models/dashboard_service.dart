import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:organiseyou/auth/auth_service.dart';

class DashboardService {
  final AuthService _authService;

  DashboardService(this._authService);

  Future<List<dynamic>> getDashboards() async {
    final token = await _authService.getToken();
    if (token == null) {
      throw Exception('Not authenticated');
    }

    final response = await http.get(
      Uri.parse('${_authService.backendUrl}/dashboards'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load dashboards');
    }
  }
}
