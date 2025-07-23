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
    required double normalAmount,
    required UnitEnum unit,
    required double conversionAmount,
    required UnitEnum conversionUnit,
    required String name,
  }) = _GroceryData;

  factory GroceryData.fromJson(Map<String, Object?> json) =>
      _$GroceryDataFromJson(json);

  factory GroceryData.fromRow(GroceryTableData data) => GroceryData(
    id: data.id,
    normalAmount: data.normalAmount,
    unit: $enumDecode(_$UnitEnumEnumMap, data.unit),
    conversionAmount: data.conversionAmount,
    conversionUnit: $enumDecode(_$UnitEnumEnumMap, data.conversionUnit),
    name: data.name,
  );
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

  GroceryTableCompanion toTableCompanion() => GroceryTableCompanion.insert(
    id: id,
    normalAmount: normalAmount,
    unit: _$UnitEnumEnumMap[unit]!,
    conversionAmount: conversionAmount,
    conversionUnit: _$UnitEnumEnumMap[conversionUnit]!,
    name: name,
  );
}
