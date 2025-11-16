
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:myapp/models/app_config.dart';

class JsonService {
  Future<AppConfig> loadConfig() async {
    final String response = await rootBundle.loadString('assets/app_config.json');
    final data = await json.decode(response);
    return AppConfig.fromJson(data);
  }
}
