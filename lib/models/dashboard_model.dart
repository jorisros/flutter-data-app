import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(createToJson: false)
class Dashboard {
  final DashboardSettings settings;
  @JsonKey(defaultValue: [])
  final List<Entity> entities;
  @JsonKey(defaultValue: [])
  final List<Grid> grids;

  Dashboard({required this.settings, required this.entities, required this.grids});

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}

@JsonSerializable(createToJson: false)
class DashboardSettings {
  final String name;

  DashboardSettings({required this.name});

  factory DashboardSettings.fromJson(Map<String, dynamic> json) =>
      _$DashboardSettingsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Entity {
  final String id;
  @JsonKey(defaultValue: [])
  final List<EntityColumn> columns;

  Entity({required this.id, required this.columns});

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

@JsonSerializable(createToJson: false)
class EntityColumn {
  final String id;
  final String restName;

  EntityColumn({required this.id, required this.restName});

  factory EntityColumn.fromJson(Map<String, dynamic> json) =>
      _$EntityColumnFromJson(json);
}


@JsonSerializable(createToJson: false)
class Grid {
  final String id;
  final String name;
  final String entity;
  @JsonKey(defaultValue: [])
  final List<GridColumn> columns;

  Grid({required this.id, required this.name, required this.entity, required this.columns});

  factory Grid.fromJson(Map<String, dynamic> json) => _$GridFromJson(json);
}

@JsonSerializable(createToJson: false)
class GridColumn {
  @JsonKey(name: 'column')
  final String columnId;
  final String? label;

  // This is populated manually after deserialization.
  @JsonKey(includeFromJson: false)
  String field = '';

  GridColumn({required this.columnId, this.label});

  String get displayLabel => label ?? field;

  factory GridColumn.fromJson(Map<String, dynamic> json) =>
      _$GridColumnFromJson(json);
}
