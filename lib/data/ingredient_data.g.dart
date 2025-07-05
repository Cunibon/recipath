// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientData _$IngredientDataFromJson(Map<String, dynamic> json) =>
    _IngredientData(
      amount: (json['amount'] as num).toDouble(),
      unit: $enumDecode(_$UnitEnumEnumMap, json['unit']),
      groceryId: json['groceryId'] as String,
    );

Map<String, dynamic> _$IngredientDataToJson(_IngredientData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'unit': _$UnitEnumEnumMap[instance.unit]!,
      'groceryId': instance.groceryId,
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
