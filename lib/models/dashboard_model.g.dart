// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
  settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
  grids: (json['grids'] as List<dynamic>)
      .map((e) => Grid.fromJson(e as Map<String, dynamic>))
      .toList(),
  entities: (json['entities'] as List<dynamic>)
      .map((e) => Entity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
  'settings': instance.settings.toJson(),
  'grids': instance.grids.map((e) => e.toJson()).toList(),
  'entities': instance.entities.map((e) => e.toJson()).toList(),
};

Settings _$SettingsFromJson(Map<String, dynamic> json) =>
    Settings(name: json['name'] as String);

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
  'name': instance.name,
};

Grid _$GridFromJson(Map<String, dynamic> json) => Grid(
  id: json['id'] as String,
  name: json['name'] as String,
  entity: json['entity'] as String,
  columns: (json['columns'] as List<dynamic>)
      .map((e) => GridColumn.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GridToJson(Grid instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'entity': instance.entity,
  'columns': instance.columns.map((e) => e.toJson()).toList(),
};

GridColumn _$GridColumnFromJson(Map<String, dynamic> json) =>
    GridColumn(field: json['field'] as String, label: json['label'] as String);

Map<String, dynamic> _$GridColumnToJson(GridColumn instance) =>
    <String, dynamic>{'field': instance.field, 'label': instance.label};

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
  id: json['id'] as String,
  name: json['name'] as String,
  forms: (json['forms'] as List<dynamic>)
      .map((e) => Form.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'forms': instance.forms.map((e) => e.toJson()).toList(),
};

Form _$FormFromJson(Map<String, dynamic> json) => Form(
  id: json['id'] as String,
  name: json['name'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FormField.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'fields': instance.fields.map((e) => e.toJson()).toList(),
};

FormField _$FormFieldFromJson(Map<String, dynamic> json) => FormField(
  id: json['id'] as String,
  label: json['label'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$FormFieldToJson(FormField instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'type': instance.type,
};
