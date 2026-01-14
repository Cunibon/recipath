import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/kcal_chart/providers/nutriment_enum.dart';

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
    String? barcode,
    double? kcal,
    double? fat,
    double? carbs,
    double? protein,
    double? fiber,
    @Default(false) bool archived,
    @Default(false) bool uploaded,
  }) = _GroceryData;

  factory GroceryData.fromJson(Map<String, Object?> json) =>
      _$GroceryDataFromJson(json);

  factory GroceryData.fromTableData(GroceryTableData data) => GroceryData(
    id: data.id,
    name: data.name,
    normalAmount: data.normalAmount,
    unit: $enumDecode(_$UnitEnumEnumMap, data.unit),
    conversionAmount: data.conversionAmount,
    conversionUnit: $enumDecode(_$UnitEnumEnumMap, data.conversionUnit),
    barcode: data.barcode,
    kcal: data.kcal,
    fat: data.fat,
    carbs: data.carbs,
    protein: data.protein,
    fiber: data.fiber,
    archived: data.archived,
    uploaded: data.uploaded,
  );

  factory GroceryData.fromSupabase(Map<String, dynamic> data) =>
      GroceryData.fromJson(data..[uploadedKey] = true);

  static UnitEnum jsonStringToEnum(String enumString) =>
      $enumDecode(_$UnitEnumEnumMap, enumString);
}

extension GroceryDataFunctions on GroceryData {
  String toReadable({
    required Map<UnitEnum, String> unitLocalized,
    required NumberFormat doubleNumberFormat,
  }) =>
      "${doubleNumberFormat.format(normalAmount)}${unitLocalized[unit]} $name";

  double convertToNorm(double value, UnitEnum otherUnit) {
    final unitType = UnitConversion.unitType(unit);
    final otherUnitType = UnitConversion.unitType(otherUnit);

    if (unit == otherUnit) {
      return value;
    }

    if (unitType == UnitType.misc || otherUnitType == UnitType.misc) {
      final grams = convertToGram(value, otherUnit);
      return UnitConversion.convert(grams, UnitEnum.g, unit);
    }

    if (unitType == otherUnitType) {
      return UnitConversion.convert(value, otherUnit, unit);
    } else {
      return UnitConversion.convert(value, otherUnit, conversionUnit) *
          (normalAmount / conversionAmount);
    }
  }

  double convertToGram(double value, UnitEnum otherUnit) {
    final otherUnitType = UnitConversion.unitType(otherUnit);

    if (otherUnitType == UnitType.misc) {
      return (value / normalAmount) * conversionAmount;
    }
    return convertFromTo(value, otherUnit, UnitEnum.g);
  }

  double convertFromTo(double value, UnitEnum startUnit, UnitEnum newUnit) {
    if (startUnit == newUnit) {
      return value;
    }

    final startUnitType = UnitConversion.unitType(startUnit);
    final newUnitType = UnitConversion.unitType(newUnit);
    final conversionUnitType = UnitConversion.unitType(conversionUnit);

    if (startUnitType == UnitType.misc || newUnitType == UnitType.misc) {
      final grams = convertToGram(value, startUnit);
      return UnitConversion.convert(grams, UnitEnum.g, newUnit);
    }

    if (newUnitType == startUnitType) {
      return UnitConversion.convert(value, startUnit, newUnit);
    } else if (startUnitType == conversionUnitType) {
      return UnitConversion.convert(
        UnitConversion.convert(value, startUnit, conversionUnit) *
            (normalAmount / conversionAmount),
        unit,
        newUnit,
      );
    } else {
      return UnitConversion.convert(
        UnitConversion.convert(value, startUnit, unit) *
            (conversionAmount / normalAmount),
        conversionUnit,
        newUnit,
      );
    }
  }

  bool isUnitAllowed(UnitEnum otherUnit) {
    final unitType = UnitConversion.unitType(otherUnit);
    final groceryUnitType = UnitConversion.unitType(unit);
    final conversionUnitType = UnitConversion.unitType(conversionUnit);

    if (groceryUnitType == UnitType.misc) {
      return unitType == UnitType.misc;
    }

    if (unitType == UnitType.misc) {
      return false;
    }

    return unitType == groceryUnitType || unitType == conversionUnitType;
  }

  Map<Nutriments, double?> getNutrients() => {
    Nutriments.kcal: kcal,
    Nutriments.fat: fat,
    Nutriments.carbs: carbs,
    Nutriments.protein: protein,
    Nutriments.fiber: fiber,
  };

  GroceryTableCompanion toTableCompanion() => GroceryTableCompanion.insert(
    id: id,
    name: name,
    normalAmount: normalAmount,
    unit: _$UnitEnumEnumMap[unit]!,
    conversionAmount: conversionAmount,
    conversionUnit: _$UnitEnumEnumMap[conversionUnit]!,
    barcode: drift.Value(barcode),
    kcal: drift.Value(kcal),
    fat: drift.Value(fat),
    carbs: drift.Value(carbs),
    protein: drift.Value(protein),
    fiber: drift.Value(fiber),
    archived: drift.Value(archived),
    uploaded: drift.Value(uploaded),
  );

  Map<String, dynamic> toSupabase() => toJson()..remove(uploadedKey);
}
