import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _backendUrlKey = 'backend_url';

  Future<void> saveBackendUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_backendUrlKey, url);
  }

  Future<String?> getBackendUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_backendUrlKey);
  }
}
