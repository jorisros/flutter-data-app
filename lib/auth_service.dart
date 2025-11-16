import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myapp/settings_service.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final String _tokenKey = 'auth_token';
  final SettingsService _settingsService;
  String? _token;

  AuthService(this._settingsService);

  Future<bool> login(String email, String password) async {
    final backendUrl = await _settingsService.getBackendUrl();
    if (backendUrl == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('$backendUrl/get-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody.containsKey('token')) {
        _token = responseBody['token'];
        await _storage.write(key: _tokenKey, value: _token);
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: _tokenKey);
    notifyListeners();
  }

  Future<String?> getToken() async {
    if (_token != null) return _token;
    _token = await _storage.read(key: _tokenKey);
    return _token;
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }
}
