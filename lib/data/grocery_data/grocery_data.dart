import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
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

  factory GroceryData.fromSupabase(Map<String, dynamic> data) => GroceryData(
    id: data["id"],
    name: data["name"],
    normalAmount: (data["normal_amount"] as num).toDouble(),
    unit: $enumDecode(_$UnitEnumEnumMap, data["unit"]),
    conversionAmount: (data["conversion_amount"] as num).toDouble(),
    conversionUnit: $enumDecode(_$UnitEnumEnumMap, data["conversion_unit"]),
    barcode: data["barcode"],
    kcal: (data["kcal"] as num?)?.toDouble(),
    fat: (data["fat"] as num?)?.toDouble(),
    carbs: (data["carbs"] as num?)?.toDouble(),
    protein: (data["protein"] as num?)?.toDouble(),
    fiber: (data["fiber"] as num?)?.toDouble(),
    archived: data["archived"],
    uploaded: true,
  );

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
    final baseValue = convertFromTo(value, otherUnit, UnitEnum.g);
    final otherUnitType = UnitConversion.unitType(otherUnit);

    if (otherUnitType == UnitType.misc) {
      return (value / normalAmount) * conversionAmount;
    } else {
      return baseValue;
    }
  }

  double convertFromTo(double value, UnitEnum startUnit, UnitEnum newUnit) {
    final startUnitType = UnitConversion.unitType(startUnit);
    final newUnitType = UnitConversion.unitType(newUnit);
    final conversionUnitType = UnitConversion.unitType(conversionUnit);

    if (startUnitType == UnitType.misc || newUnitType == UnitType.misc) {
      return value;
    } else if (newUnitType == startUnitType) {
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

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "name": name,
    "normal_amount": normalAmount,
    "unit": _$UnitEnumEnumMap[unit]!,
    "conversion_amount": conversionAmount,
    "conversion_unit": _$UnitEnumEnumMap[conversionUnit]!,
    "barcode": barcode,
    "kcal": kcal,
    "fat": fat,
    "carbs": carbs,
    "protein": protein,
    "fiber": fiber,
    "archived": archived,
  };
}
