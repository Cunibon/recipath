// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GTINData _$GTINDataFromJson(Map<String, dynamic> json) => _GTINData(
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
  unit: $enumDecode(_$UnitEnumEnumMap, json['unit']),
  kcal: (json['kcal'] as num?)?.toDouble(),
);

Map<String, dynamic> _$GTINDataToJson(_GTINData instance) => <String, dynamic>{
  'name': instance.name,
  'amount': instance.amount,
  'unit': _$UnitEnumEnumMap[instance.unit]!,
  'kcal': instance.kcal,
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
