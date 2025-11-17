// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
  settings: DashboardSettings.fromJson(
    json['settings'] as Map<String, dynamic>,
  ),
  entities:
      (json['entities'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  grids:
      (json['grids'] as List<dynamic>?)
          ?.map((e) => Grid.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

DashboardSettings _$DashboardSettingsFromJson(Map<String, dynamic> json) =>
    DashboardSettings(name: json['name'] as String);

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
  id: json['id'] as String,
  columns:
      (json['columns'] as List<dynamic>?)
          ?.map((e) => EntityColumn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

EntityColumn _$EntityColumnFromJson(Map<String, dynamic> json) => EntityColumn(
  id: json['id'] as String,
  restName: json['restName'] as String,
);

Grid _$GridFromJson(Map<String, dynamic> json) => Grid(
  id: json['id'] as String,
  name: json['name'] as String,
  entity: json['entity'] as String,
  columns:
      (json['columns'] as List<dynamic>?)
          ?.map((e) => GridColumn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

GridColumn _$GridColumnFromJson(Map<String, dynamic> json) => GridColumn(
  columnId: json['column'] as String,
  label: json['label'] as String?,
);
