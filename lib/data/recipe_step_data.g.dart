// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeStepData _$RecipeStepDataFromJson(Map<String, dynamic> json) =>
    _RecipeStepData(
      id: json['id'] as String,
      description: json['description'] as String,
      ingredientIds: (json['ingredientIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeStepDataToJson(_RecipeStepData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'ingredientIds': instance.ingredientIds,
    };
