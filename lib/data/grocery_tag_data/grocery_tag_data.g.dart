// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_tag_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroceryTagData _$GroceryTagDataFromJson(Map<String, dynamic> json) =>
    _GroceryTagData(
      groceryId: json['groceryId'] as String,
      tagId: json['tagId'] as String,
      deleted: json['deleted'] as bool? ?? false,
      uploaded: json['uploaded'] as bool? ?? false,
    );

Map<String, dynamic> _$GroceryTagDataToJson(_GroceryTagData instance) =>
    <String, dynamic>{
      'groceryId': instance.groceryId,
      'tagId': instance.tagId,
      'deleted': instance.deleted,
      'uploaded': instance.uploaded,
    };
