import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class Dashboard {
  final DashboardSettings settings;
  final List<Grid> grids;

  Dashboard({required this.settings, required this.grids});

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class DashboardSettings {
  final String name;

  DashboardSettings({required this.name});

  factory DashboardSettings.fromJson(Map<String, dynamic> json) =>
      _$DashboardSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardSettingsToJson(this);
}

@JsonSerializable()
class Grid {
  final String id;
  final String name;
  final List<GridColumn> columns;

  Grid({required this.id, required this.name, required this.columns});

  factory Grid.fromJson(Map<String, dynamic> json) => _$GridFromJson(json);
  Map<String, dynamic> toJson() => _$GridToJson(this);
}

@JsonSerializable()
class GridColumn {
  final String field;
  final String label;

  GridColumn({required this.field, required this.label});

  factory GridColumn.fromJson(Map<String, dynamic> json) =>
      _$GridColumnFromJson(json);
  Map<String, dynamic> toJson() => _$GridColumnToJson(this);
}
