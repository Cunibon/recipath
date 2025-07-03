// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShoppingData _$ShoppingDataFromJson(Map<String, dynamic> json) =>
    _ShoppingData(
      id: json['id'] as String,
      done: json['done'] as bool,
      ingredient: IngredientData.fromJson(
        json['ingredient'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ShoppingDataToJson(_ShoppingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'done': instance.done,
      'ingredient': instance.ingredient,
    };
