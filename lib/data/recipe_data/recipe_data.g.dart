// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeData _$RecipeDataFromJson(Map<String, dynamic> json) => _RecipeData(
  id: json['id'] as String,
  parent: json['parent'] as String?,
  title: json['title'] as String,
  servings: (json['servings'] as num?)?.toInt(),
  imageName: json['imageName'] as String?,
  steps: IList<RecipeStepData>.fromJson(
    json['steps'],
    (value) => RecipeStepData.fromJson(value as Map<String, dynamic>),
  ),
  archived: json['archived'] as bool? ?? false,
  uploaded: json['uploaded'] ?? false,
);

Map<String, dynamic> _$RecipeDataToJson(_RecipeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'title': instance.title,
      'servings': instance.servings,
      'imageName': instance.imageName,
      'steps': instance.steps.toJson((value) => value),
      'archived': instance.archived,
      'uploaded': instance.uploaded,
    };
