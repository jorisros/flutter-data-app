import 'package:flutter/material.dart';
import 'dart:async';

class AuthService with ChangeNotifier {
  bool _isLoggedIn = false;
  String _backendUrl = 'https://example.com'; // Default URL

  bool get isLoggedIn => _isLoggedIn;
  String get backendUrl => _backendUrl;

  Future<bool> login(String username, String password) async {
    // Mock login logic
    await Future.delayed(const Duration(seconds: 1));
    if (username.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    notifyListeners();
  }

  void setBackendUrl(String url) {
    _backendUrl = url;
    notifyListeners();
  }
}
