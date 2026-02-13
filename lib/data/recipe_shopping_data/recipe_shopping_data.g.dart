// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeShoppingData _$RecipeShoppingDataFromJson(Map<String, dynamic> json) =>
    _RecipeShoppingData(
      id: json['id'] as String,
      date: dateTimeFromMillis((json['date'] as num).toInt()),
      recipeId: json['recipeId'] as String,
      uploaded: json['uploaded'] as bool? ?? false,
    );

Map<String, dynamic> _$RecipeShoppingDataToJson(_RecipeShoppingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': dateTimeToMillis(instance.date),
      'recipeId': instance.recipeId,
      'uploaded': instance.uploaded,
    };
