// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeData _$RecipeDataFromJson(Map<String, dynamic> json) => _RecipeData(
  id: json['id'] as String,
  title: json['title'] as String,
  servings: (json['servings'] as num?)?.toInt(),
  imageName: json['imageName'] as String?,
  archived: json['archived'] as bool? ?? false,
  steps: (json['steps'] as List<dynamic>)
      .map((e) => RecipeStepData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipeDataToJson(_RecipeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'servings': instance.servings,
      'imageName': instance.imageName,
      'archived': instance.archived,
      'steps': instance.steps,
    };
