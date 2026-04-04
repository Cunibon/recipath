// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagData _$TagDataFromJson(Map<String, dynamic> json) => _TagData(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  tagType: $enumDecode(_$TagTypeEnumEnumMap, json['tagType']),
  color: const ColorConverter().fromJson((json['color'] as num).toInt()),
  deleted: json['deleted'] as bool? ?? false,
  uploaded: json['uploaded'] as bool? ?? false,
);

Map<String, dynamic> _$TagDataToJson(_TagData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'tagType': _$TagTypeEnumEnumMap[instance.tagType]!,
  'color': const ColorConverter().toJson(instance.color),
  'deleted': instance.deleted,
  'uploaded': instance.uploaded,
};

const _$TagTypeEnumEnumMap = {
  TagTypeEnum.recipe: 'Recipe',
  TagTypeEnum.grocery: 'Grocery',
};
