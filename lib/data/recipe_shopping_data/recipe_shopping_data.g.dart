// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeShoppingData _$RecipeShoppingDataFromJson(Map<String, dynamic> json) =>
    _RecipeShoppingData(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      recipeId: json['recipeId'] as String,
    );

Map<String, dynamic> _$RecipeShoppingDataToJson(_RecipeShoppingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'recipeId': instance.recipeId,
    };
