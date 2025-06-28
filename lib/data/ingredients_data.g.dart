// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientsData _$IngredientsDataFromJson(Map<String, dynamic> json) =>
    _IngredientsData(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      grocery: GroceryData.fromJson(json['grocery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientsDataToJson(_IngredientsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'grocery': instance.grocery,
    };
