import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Dashboard {
  final Settings settings;
  final List<Grid> grids;
  final List<Entity> entities;

  Dashboard({
    required this.settings,
    required this.grids,
    required this.entities,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class Settings {
  final String name;

  Settings({required this.name});

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Grid {
  final String id;
  final String name;
  final String entity;
  final List<GridColumn> columns;

  Grid({
    required this.id,
    required this.name,
    required this.entity,
    required this.columns,
  });

  factory Grid.fromJson(Map<String, dynamic> json) => _$GridFromJson(json);
  Map<String, dynamic> toJson() => _$GridToJson(this);
}

@JsonSerializable()
class GridColumn {
  final String field;
  final String label;

  GridColumn({required this.field, required this.label});

  factory GridColumn.fromJson(Map<String, dynamic> json) => _$GridColumnFromJson(json);
  Map<String, dynamic> toJson() => _$GridColumnToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Entity {
  final String id;
  final String name;
  final List<Form> forms;

  Entity({
    required this.id,
    required this.name,
    required this.forms,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Form {
  final String id;
  final String name;
  final List<FormField> fields;

  Form({
    required this.id,
    required this.name,
    required this.fields,
  });

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
  Map<String, dynamic> toJson() => _$FormToJson(this);
}

@JsonSerializable()
class FormField {
  final String id;
  final String label;
  final String type;

  FormField({
    required this.id,
    required this.label,
    required this.type,
  });

  factory FormField.fromJson(Map<String, dynamic> json) => _$FormFieldFromJson(json);
  Map<String, dynamic> toJson() => _$FormFieldToJson(this);
}