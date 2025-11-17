import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:organiseyou/models.dart';

class DashboardProvider with ChangeNotifier {
  Dashboard? _dashboard;
  bool _isLoading = false;
  String? _error;

  Dashboard? get dashboard => _dashboard;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchDashboard() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));
      final response = http.Response(
        json.encode({
          'widgets': [
            {
              'type': 'dataTable',
              'data': {
                'title': 'Users',
                'columns': ['Name', 'Email', 'Role'],
                'rows': [
                  ['Alice', 'alice@example.com', 'Admin'],
                  ['Bob', 'bob@example.com', 'User'],
                  ['Charlie', 'charlie@example.com', 'User']
                ]
              }
            }
          ]
        }),
        200,
      );

      if (response.statusCode == 200) {
        _dashboard = Dashboard.fromJson(json.decode(response.body));
        _error = null;
      } else {
        _error = 'Failed to load dashboard';
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
