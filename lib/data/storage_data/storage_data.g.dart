// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorageData _$StorageDataFromJson(Map<String, dynamic> json) => _StorageData(
  id: json['id'] as String,
  ingredient: IngredientData.fromJson(
    json['ingredient'] as Map<String, dynamic>,
  ),
  uploaded: json['uploaded'] as bool,
);

Map<String, dynamic> _$StorageDataToJson(_StorageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredient': instance.ingredient,
      'uploaded': instance.uploaded,
    };
