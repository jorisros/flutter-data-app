import 'package:json_annotation/json_annotation.dart';

part 'dashboard.g.dart';

@JsonSerializable()
class Dashboard {
  @JsonKey(name: 'settings')
  final DashboardSettings settings;
  @JsonKey(name: 'grids')
  final List<Grid> grids;

  Dashboard({required this.settings, required this.grids});

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class DashboardSettings {
  @JsonKey(name: 'name')
  final String name;

  DashboardSettings({required this.name});

  factory DashboardSettings.fromJson(Map<String, dynamic> json) =>
      _$DashboardSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardSettingsToJson(this);
}

@JsonSerializable()
class Grid {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'columns')
  final List<GridColumn> columns;

  Grid({required this.id, required this.name, required this.columns});

  factory Grid.fromJson(Map<String, dynamic> json) => _$GridFromJson(json);
  Map<String, dynamic> toJson() => _$GridToJson(this);
}

@JsonSerializable()
class GridColumn {
  @JsonKey(name: 'field')
  final String field;
  @JsonKey(name: 'label')
  final String label;

  GridColumn({required this.field, required this.label});

  factory GridColumn.fromJson(Map<String, dynamic> json) =>
      _$GridColumnFromJson(json);
  Map<String, dynamic> toJson() => _$GridColumnToJson(this);
}
