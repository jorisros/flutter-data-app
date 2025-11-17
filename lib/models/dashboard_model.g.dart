// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
  settings: DashboardSettings.fromJson(
    json['settings'] as Map<String, dynamic>,
  ),
  grids: (json['grids'] as List<dynamic>)
      .map((e) => Grid.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
  'settings': instance.settings,
  'grids': instance.grids,
};

DashboardSettings _$DashboardSettingsFromJson(Map<String, dynamic> json) =>
    DashboardSettings(name: json['name'] as String);

Map<String, dynamic> _$DashboardSettingsToJson(DashboardSettings instance) =>
    <String, dynamic>{'name': instance.name};

Grid _$GridFromJson(Map<String, dynamic> json) => Grid(
  id: json['id'] as String,
  name: json['name'] as String,
  columns:
      (json['columns'] as List<dynamic>?)
          ?.map((e) => GridColumn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$GridToJson(Grid instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'columns': instance.columns,
};

GridColumn _$GridColumnFromJson(Map<String, dynamic> json) =>
    GridColumn(field: json['field'] as String, label: json['label'] as String?);

Map<String, dynamic> _$GridColumnToJson(GridColumn instance) =>
    <String, dynamic>{'field': instance.field, 'label': instance.label};
