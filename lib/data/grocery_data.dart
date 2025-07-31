import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/drift/database.dart';

part 'grocery_data.freezed.dart';
part 'grocery_data.g.dart';

@freezed
abstract class GroceryData with _$GroceryData {
  const factory GroceryData({
    required String id,
    required String name,
    required double normalAmount,
    required UnitEnum unit,
    required double conversionAmount,
    required UnitEnum conversionUnit,
    double? kcal,
    double? fat,
    double? carbs,
    double? protein,
    double? fiber,
  }) = _GroceryData;

  factory GroceryData.fromJson(Map<String, Object?> json) =>
      _$GroceryDataFromJson(json);

  factory GroceryData.fromRow(GroceryTableData data) => GroceryData(
    id: data.id,
    name: data.name,
    normalAmount: data.normalAmount,
    unit: $enumDecode(_$UnitEnumEnumMap, data.unit),
    conversionAmount: data.conversionAmount,
    conversionUnit: $enumDecode(_$UnitEnumEnumMap, data.conversionUnit),
    kcal: data.kcal,
    fat: data.fat,
    carbs: data.carbs,
    protein: data.protein,
    fiber: data.fiber,
  );

  static UnitEnum jsonStringToEnum(String enumString) =>
      $enumDecode(_$UnitEnumEnumMap, enumString);
}

extension GroceryDataFunctions on GroceryData {
  String toReadable() =>
      "${doubleNumberFormat.format(normalAmount)}${unit.name} $name";

  double convertToNorm(double value, UnitEnum otherUnit) {
    final unitType = UnitConversion.unitType(unit);
    final otherUnitType = UnitConversion.unitType(otherUnit);

    if (unitType == UnitType.misc || otherUnitType == UnitType.misc) {
      return value;
    }

    if (unitType == otherUnitType) {
      return UnitConversion.convert(value, otherUnit, unit);
    } else {
      return UnitConversion.convert(value, otherUnit, conversionUnit) *
          (normalAmount / conversionAmount);
    }
  }

  double convertToGram(double value, UnitEnum otherUnit) {
    final unitType = UnitConversion.unitType(unit); // this.unit
    final otherUnitType = UnitConversion.unitType(otherUnit);

    if (otherUnitType == UnitType.misc) {
      return (value / normalAmount) * conversionAmount;
    } else if (otherUnitType == UnitType.volume) {
      if (unitType == UnitType.volume) {
        return UnitConversion.convert(
          UnitConversion.convert(value, otherUnit, unit) *
              (conversionAmount / normalAmount),
          unit,
          UnitEnum.g,
        );
      } else {
        return UnitConversion.convert(
          UnitConversion.convert(value, otherUnit, conversionUnit) *
              (normalAmount / conversionAmount),
          conversionUnit,
          UnitEnum.g,
        );
      }
    } else {
      return UnitConversion.convert(value, otherUnit, UnitEnum.g);
    }
  }

  Map<String, double?> getNutrients() => {
    'kcal': kcal,
    'fat': fat,
    'carbs': carbs,
    'protein': protein,
    'fiber': fiber,
  };

  GroceryTableCompanion toTableCompanion() => GroceryTableCompanion.insert(
    id: id,
    name: name,
    normalAmount: normalAmount,
    unit: _$UnitEnumEnumMap[unit]!,
    conversionAmount: conversionAmount,
    conversionUnit: _$UnitEnumEnumMap[conversionUnit]!,
    kcal: drift.Value(kcal),
    fat: drift.Value(fat),
    carbs: drift.Value(carbs),
    protein: drift.Value(protein),
    fiber: drift.Value(fiber),
  );
}
