
import 'package:flutter/foundation.dart';

@immutable
class Dashboard {
  final String id;
  final String name;

  const Dashboard({
    required this.id,
    required this.name,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
