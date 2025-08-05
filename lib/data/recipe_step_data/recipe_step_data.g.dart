// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeStepData _$RecipeStepDataFromJson(Map<String, dynamic> json) =>
    _RecipeStepData(
      id: json['id'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeStepDataToJson(_RecipeStepData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'ingredients': instance.ingredients,
    };
