import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:organiseyou/settings_service.dart';

class AuthService with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final SettingsService _settingsService;
  late String _backendUrl;

  String? _token;

  AuthService(this._settingsService) {
    _loadBackendUrl();
  }

  Future<void> _loadBackendUrl() async {
    _backendUrl = await _settingsService.getBackendUrl();
    notifyListeners();
  }

  void setBackendUrl(String url) {
    _backendUrl = url;
    notifyListeners();
  }

  bool get isLoggedIn => _token != null;

  String get backendUrl => _backendUrl;

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_backendUrl/get-token'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        await _storage.write(key: 'auth_token', value: _token);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: 'auth_token');
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    _token = await _storage.read(key: 'auth_token');
    notifyListeners();
  }

    Future<String?> getToken() async {
    if (_token == null) {
      _token = await _storage.read(key: 'auth_token');
      notifyListeners();
    }
    return _token;
  }
}
