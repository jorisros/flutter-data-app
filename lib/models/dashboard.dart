import 'package:organiseyou/models/grid.dart';

class Dashboard {
  final String id;
  final String name;
  final List<Grid> grids;

  Dashboard({required this.id, required this.name, required this.grids});

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    var list = json['grids'] as List;
    List<Grid> gridsList = list.map((i) => Grid.fromJson(i)).toList();
    return Dashboard(
      id: json['id'],
      name: json['name'],
      grids: gridsList,
    );
  }
}
