
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  final AppSettings settings;
  final List<Entity> entities;
  final List<Role> roles;
  final List<Grid> grid;

  AppConfig({required this.settings, required this.entities, required this.roles, required this.grid});

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
  final bool encrypt;
  final ColumnSettings? settings;

  Column({required this.id, required this.name, required this.label, required this.type, required this.encrypt, this.settings});

  factory Column.fromJson(Map<String, dynamic> json) => _$ColumnFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnToJson(this);
}

@JsonSerializable()
class ColumnSettings {
  @JsonKey(name: 'related_entity')
  final String? relatedEntity;

  ColumnSettings({this.relatedEntity});

  factory ColumnSettings.fromJson(Map<String, dynamic> json) => _$ColumnSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnSettingsToJson(this);
}

@JsonSerializable()
class Role {
  final String id;
  final String label;

  Role({required this.id, required this.label});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Grid {
  final String id;
  final String type;
  final String name;
  final String location;
  final String entity;
  final List<Field>? fields;

  Grid({required this.id, required this.type, required this.name, required this.location, required this.entity, this.fields});

  factory Grid.fromJson(Map<String, dynamic> json) => _$GridFromJson(json);
  Map<String, dynamic> toJson() => _$GridToJson(this);
}

@JsonSerializable()
class Field {
  final String id;
  @JsonKey(name: 'type_group')
  final String typeGroup;
  final String type;
  final String? value;
  final String? name;
  final String? label;
  @JsonKey(name: 'is_required')
  final bool? isRequired;
  final String? column;
  final FieldSettings? settings;

  Field({required this.id, required this.typeGroup, required this.type, this.value, this.name, this.label, this.isRequired, this.column, this.settings});

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}

@JsonSerializable()
class FieldSettings {
  @JsonKey(name: 'visible_column')
  final String? visibleColumn;
  final List<Validator>? validators;

  FieldSettings({this.visibleColumn, this.validators});

  factory FieldSettings.fromJson(Map<String, dynamic> json) => _$FieldSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$FieldSettingsToJson(this);
}

@JsonSerializable()
class Validator {
  final String type;

  Validator({required this.type});

  factory Validator.fromJson(Map<String, dynamic> json) => _$ValidatorFromJson(json);
  Map<String, dynamic> toJson() => _$ValidatorToJson(this);
}
