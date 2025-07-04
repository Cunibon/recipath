import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/unit_enum.dart';

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
}
