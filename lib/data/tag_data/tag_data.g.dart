// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagData _$TagDataFromJson(Map<String, dynamic> json) => _TagData(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  color: const ColorConverter().fromJson((json['color'] as num).toInt()),
  deleted: json['deleted'] as bool? ?? false,
  uploaded: json['uploaded'] as bool? ?? false,
);

Map<String, dynamic> _$TagDataToJson(_TagData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'color': const ColorConverter().toJson(instance.color),
  'deleted': instance.deleted,
  'uploaded': instance.uploaded,
};
