// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroceryData _$GroceryDataFromJson(Map<String, dynamic> json) => _GroceryData(
  id: json['id'] as String,
  name: json['name'] as String,
  normalAmount: (json['normalAmount'] as num).toDouble(),
  unit: $enumDecode(_$UnitEnumEnumMap, json['unit']),
  conversionAmount: (json['conversionAmount'] as num).toDouble(),
  conversionUnit: $enumDecode(_$UnitEnumEnumMap, json['conversionUnit']),
  kcal: (json['kcal'] as num?)?.toDouble(),
  fat: (json['fat'] as num?)?.toDouble(),
  carbs: (json['carbs'] as num?)?.toDouble(),
  protein: (json['protein'] as num?)?.toDouble(),
  fiber: (json['fiber'] as num?)?.toDouble(),
  archived: json['archived'] as bool? ?? false,
  uploaded: json['uploaded'] as bool,
);

Map<String, dynamic> _$GroceryDataToJson(_GroceryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'normalAmount': instance.normalAmount,
      'unit': _$UnitEnumEnumMap[instance.unit]!,
      'conversionAmount': instance.conversionAmount,
      'conversionUnit': _$UnitEnumEnumMap[instance.conversionUnit]!,
      'kcal': instance.kcal,
      'fat': instance.fat,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'fiber': instance.fiber,
      'archived': instance.archived,
      'uploaded': instance.uploaded,
    };

const _$UnitEnumEnumMap = {
  UnitEnum.ml: 'Milliliter',
  UnitEnum.l: 'Liter',
  UnitEnum.tsp: 'Teaspoon',
  UnitEnum.tbsp: 'Tablespoon',
  UnitEnum.cup: 'Cup',
  UnitEnum.g: 'Gram',
  UnitEnum.kg: 'Kilogram',
  UnitEnum.oz: 'Ounce',
  UnitEnum.lb: 'Pound',
  UnitEnum.pinch: 'Pinch',
  UnitEnum.clove: 'Clove',
  UnitEnum.can: 'Can',
  UnitEnum.piece: 'Piece',
};
