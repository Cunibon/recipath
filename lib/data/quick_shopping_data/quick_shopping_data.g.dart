// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_shopping_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuickShoppingData _$QuickShoppingDataFromJson(Map<String, dynamic> json) =>
    _QuickShoppingData(
      id: json['id'] as String,
      done: json['done'] as bool,
      description: json['description'] as String,
      deleted: json['deleted'] as bool? ?? false,
      uploaded: json['uploaded'] as bool? ?? false,
    );

Map<String, dynamic> _$QuickShoppingDataToJson(_QuickShoppingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'done': instance.done,
      'description': instance.description,
      'deleted': instance.deleted,
      'uploaded': instance.uploaded,
    };
