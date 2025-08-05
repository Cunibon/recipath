// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShoppingData _$ShoppingDataFromJson(Map<String, dynamic> json) =>
    _ShoppingData(
      id: json['id'] as String,
      done: json['done'] as bool,
      count: (json['count'] as num).toInt(),
      ingredient: IngredientData.fromJson(
        json['ingredient'] as Map<String, dynamic>,
      ),
      uploaded: json['uploaded'] as bool,
    );

Map<String, dynamic> _$ShoppingDataToJson(_ShoppingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'done': instance.done,
      'count': instance.count,
      'ingredient': instance.ingredient,
      'uploaded': instance.uploaded,
    };
