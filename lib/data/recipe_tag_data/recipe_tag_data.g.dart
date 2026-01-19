// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tag_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeTagData _$RecipeTagDataFromJson(Map<String, dynamic> json) =>
    _RecipeTagData(
      recipeId: json['recipe_id'] as String,
      tagId: json['tag_id'] as String,
      deleted: json['deleted'] as bool? ?? false,
      uploaded: json['uploaded'] as bool? ?? false,
    );

Map<String, dynamic> _$RecipeTagDataToJson(_RecipeTagData instance) =>
    <String, dynamic>{
      'recipe_id': instance.recipeId,
      'tag_id': instance.tagId,
      'deleted': instance.deleted,
      'uploaded': instance.uploaded,
    };
