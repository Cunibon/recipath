// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeStatisticData _$RecipeStatisticDataFromJson(Map<String, dynamic> json) =>
    _RecipeStatisticData(
      id: json['id'] as String,
      startDate: dateTimeFromMillis((json['start_date'] as num).toInt()),
      endDate: dateTimeFromMillis((json['end_date'] as num).toInt()),
      recipeId: json['recipe_id'] as String,
      servings: (json['servings'] as num?)?.toInt(),
      uploaded: json['uploaded'] as bool? ?? false,
    );

Map<String, dynamic> _$RecipeStatisticDataToJson(
  _RecipeStatisticData instance,
) => <String, dynamic>{
  'id': instance.id,
  'start_date': dateTimeToMillis(instance.startDate),
  'end_date': dateTimeToMillis(instance.endDate),
  'recipe_id': instance.recipeId,
  'servings': instance.servings,
  'uploaded': instance.uploaded,
};
