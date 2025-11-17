import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password) async {
    // In a real app, you'd have network requests and error handling here
    await Future.delayed(const Duration(seconds: 1));
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _isAuthenticated = false;
    notifyListeners();
  }
}
