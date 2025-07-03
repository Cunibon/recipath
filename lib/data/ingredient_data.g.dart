// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientData _$IngredientDataFromJson(Map<String, dynamic> json) =>
    _IngredientData(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      groceryId: json['groceryId'] as String,
    );

Map<String, dynamic> _$IngredientDataToJson(_IngredientData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'groceryId': instance.groceryId,
    };
