// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeData _$RecipeDataFromJson(Map<String, dynamic> json) => _RecipeData(
  id: json['id'] as String,
  title: json['title'] as String,
  imageName: json['imageName'] as String?,
  steps: (json['steps'] as List<dynamic>)
      .map((e) => RecipeStepData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipeDataToJson(_RecipeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageName': instance.imageName,
      'steps': instance.steps,
    };
