// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeStatisticData _$RecipeStatisticDataFromJson(Map<String, dynamic> json) =>
    _RecipeStatisticData(
      id: json['id'] as String,
      startDate: dateTimeFromMillis((json['startDate'] as num).toInt()),
      endDate: dateTimeFromMillis((json['endDate'] as num).toInt()),
      recipeId: json['recipeId'] as String,
      servings: (json['servings'] as num?)?.toInt(),
      uploaded: json['uploaded'] as bool? ?? false,
    );

Map<String, dynamic> _$RecipeStatisticDataToJson(
  _RecipeStatisticData instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': dateTimeToMillis(instance.startDate),
  'endDate': dateTimeToMillis(instance.endDate),
  'recipeId': instance.recipeId,
  'servings': instance.servings,
  'uploaded': instance.uploaded,
};
