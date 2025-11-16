
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();
  final String _tokenKey = 'auth_token';
  final String _apiUrl = 'https://organiseyou.ddev.site/api';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_apiUrl/get-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-T',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody.containsKey('token')) {
        await _storage.write(key: _tokenKey, value: responseBody['token']);
        return true;
      }
    }
    return false;
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }
}
