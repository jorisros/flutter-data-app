// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
  settings: AppSettings.fromJson(json['settings'] as Map<String, dynamic>),
  entities: (json['entities'] as List<dynamic>)
      .map((e) => Entity.fromJson(e as Map<String, dynamic>))
      .toList(),
  grids: (json['grids'] as List<dynamic>)
      .map((e) => Grid.fromJson(e as Map<String, dynamic>))
      .toList(),
  forms: (json['forms'] as List<dynamic>)
      .map((e) => Form.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
  'settings': instance.settings,
  'entities': instance.entities,
  'grids': instance.grids,
  'forms': instance.forms,
};

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) =>
    AppSettings(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
  id: json['id'] as String,
  name: json['name'] as String,
  label: json['label'] as String,
  columns: (json['columns'] as List<dynamic>)
      .map((e) => Column.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'label': instance.label,
  'columns': instance.columns,
};

Column _$ColumnFromJson(Map<String, dynamic> json) => Column(
  id: json['id'] as String,
  name: json['name'] as String,
  label: json['label'] as String,
  type: json['type'] as String,
  restName: json['restName'] as String,
);

Map<String, dynamic> _$ColumnToJson(Column instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'label': instance.label,
  'type': instance.type,
  'restName': instance.restName,
};

Grid _$GridFromJson(Map<String, dynamic> json) => Grid(
  id: json['id'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  entity: json['entity'] as String,
  columns: (json['columns'] as List<dynamic>)
      .map((e) => GridColumn.fromJson(e as Map<String, dynamic>))
      .toList(),
  formNew: json['formNew'] as String?,
  formEdit: json['formEdit'] as String?,
  rest: Rest.fromJson(json['rest'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GridToJson(Grid instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'entity': instance.entity,
  'columns': instance.columns,
  'formNew': instance.formNew,
  'formEdit': instance.formEdit,
  'rest': instance.rest,
};

GridColumn _$GridColumnFromJson(Map<String, dynamic> json) => GridColumn(
  id: json['id'] as String,
  label: json['label'] as String,
  column: json['column'] as String,
);

Map<String, dynamic> _$GridColumnToJson(GridColumn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'column': instance.column,
    };

Rest _$RestFromJson(Map<String, dynamic> json) =>
    Rest(list: json['list'] as String, create: json['create'] as String);

Map<String, dynamic> _$RestToJson(Rest instance) => <String, dynamic>{
  'list': instance.list,
  'create': instance.create,
};

Form _$FormFromJson(Map<String, dynamic> json) => Form(
  id: json['id'] as String,
  label: json['label'] as String,
  entity: json['entity'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FormField.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'entity': instance.entity,
  'fields': instance.fields,
};

FormField _$FormFieldFromJson(Map<String, dynamic> json) => FormField(
  id: json['id'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  label: json['label'] as String,
  isRequired: json['isRequired'] as bool,
  restName: json['restName'] as String,
);

Map<String, dynamic> _$FormFieldToJson(FormField instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'label': instance.label,
  'isRequired': instance.isRequired,
  'restName': instance.restName,
};
