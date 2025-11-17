
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  final AppSettings settings;
  final List<Entity> entities;
  final List<Grid> grids;
  final List<Form> forms;

  AppConfig({required this.settings, required this.entities, required this.grids, required this.forms});

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}

@JsonSerializable()
class AppSettings {
  final String id;
  final String name;

  AppSettings({required this.id, required this.name});

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}

@JsonSerializable()
class Entity {
  final String id;
  final String name;
  final String label;
  final List<Column> columns;

  Entity({required this.id, required this.name, required this.label, required this.columns});

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class Column {
  final String id;
  final String name;
  final String label;
  final String type;
  final String restName;


  Column({required this.id, required this.name, required this.label, required this.type, required this.restName});

  factory Column.fromJson(Map<String, dynamic> json) => _$ColumnFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnToJson(this);
}

@JsonSerializable()
class Grid {
  final String id;
  final String type;
  final String name;
  final String entity;
  final List<GridColumn> columns;
  final String? formNew;
  final String? formEdit;
  final Rest rest;

  Grid({required this.id, required this.type, required this.name, required this.entity, required this.columns, this.formNew, this.formEdit, required this.rest});

  factory Grid.fromJson(Map<String, dynamic> json) => _$GridFromJson(json);
  Map<String, dynamic> toJson() => _$GridToJson(this);
}

@JsonSerializable()
class GridColumn {
  final String id;
  final String label;
  final String column;

  GridColumn({required this.id, required this.label, required this.column});

  factory GridColumn.fromJson(Map<String, dynamic> json) => _$GridColumnFromJson(json);
  Map<String, dynamic> toJson() => _$GridColumnToJson(this);
}

@JsonSerializable()
class Rest {
  final String list;
  final String create;

  Rest({required this.list, required this.create});

  factory Rest.fromJson(Map<String, dynamic> json) => _$RestFromJson(json);
  Map<String, dynamic> toJson() => _$RestToJson(this);
}

@JsonSerializable()
class Form {
  final String id;
  final String label;
  final String entity;
  final List<FormField> fields;

  Form({required this.id, required this.label, required this.entity, required this.fields});

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
  Map<String, dynamic> toJson() => _$FormToJson(this);
}

@JsonSerializable()
class FormField {
  final String id;
  final String type;
  final String name;
  final String label;
  final bool isRequired;
  final String restName;

  FormField({required this.id, required this.type, required this.name, required this.label, required this.isRequired, required this.restName});

  factory FormField.fromJson(Map<String, dynamic> json) => _$FormFieldFromJson(json);
  Map<String, dynamic> toJson() => _$FormFieldToJson(this);
}
