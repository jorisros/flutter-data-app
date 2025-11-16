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
  roles: (json['roles'] as List<dynamic>)
      .map((e) => Role.fromJson(e as Map<String, dynamic>))
      .toList(),
  grid: (json['grid'] as List<dynamic>)
      .map((e) => Grid.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
  'settings': instance.settings,
  'entities': instance.entities,
  'roles': instance.roles,
  'grid': instance.grid,
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
  encrypt: json['encrypt'] as bool,
  settings: json['settings'] == null
      ? null
      : ColumnSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ColumnToJson(Column instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'label': instance.label,
  'type': instance.type,
  'encrypt': instance.encrypt,
  'settings': instance.settings,
};

ColumnSettings _$ColumnSettingsFromJson(Map<String, dynamic> json) =>
    ColumnSettings(relatedEntity: json['related_entity'] as String?);

Map<String, dynamic> _$ColumnSettingsToJson(ColumnSettings instance) =>
    <String, dynamic>{'related_entity': instance.relatedEntity};

Role _$RoleFromJson(Map<String, dynamic> json) =>
    Role(id: json['id'] as String, label: json['label'] as String);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
};

Grid _$GridFromJson(Map<String, dynamic> json) => Grid(
  id: json['id'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  location: json['location'] as String,
  entity: json['entity'] as String,
  fields: (json['fields'] as List<dynamic>?)
      ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GridToJson(Grid instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'location': instance.location,
  'entity': instance.entity,
  'fields': instance.fields,
};

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
  id: json['id'] as String,
  typeGroup: json['type_group'] as String,
  type: json['type'] as String,
  value: json['value'] as String?,
  name: json['name'] as String?,
  label: json['label'] as String?,
  isRequired: json['is_required'] as bool?,
  column: json['column'] as String?,
  settings: json['settings'] == null
      ? null
      : FieldSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
  'id': instance.id,
  'type_group': instance.typeGroup,
  'type': instance.type,
  'value': instance.value,
  'name': instance.name,
  'label': instance.label,
  'is_required': instance.isRequired,
  'column': instance.column,
  'settings': instance.settings,
};

FieldSettings _$FieldSettingsFromJson(Map<String, dynamic> json) =>
    FieldSettings(
      visibleColumn: json['visible_column'] as String?,
      validators: (json['validators'] as List<dynamic>?)
          ?.map((e) => Validator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FieldSettingsToJson(FieldSettings instance) =>
    <String, dynamic>{
      'visible_column': instance.visibleColumn,
      'validators': instance.validators,
    };

Validator _$ValidatorFromJson(Map<String, dynamic> json) =>
    Validator(type: json['type'] as String);

Map<String, dynamic> _$ValidatorToJson(Validator instance) => <String, dynamic>{
  'type': instance.type,
};
