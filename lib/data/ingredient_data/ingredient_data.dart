import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/drift/database.dart';

part 'ingredient_data.freezed.dart';
part 'ingredient_data.g.dart';

@freezed
abstract class IngredientData with _$IngredientData {
  const factory IngredientData({
    required String id,
    required double amount,
    required UnitEnum unit,
    required String groceryId,
  }) = _IngredientData;

  factory IngredientData.fromJson(Map<String, Object?> json) =>
      _$IngredientDataFromJson(json);

  factory IngredientData.fromTableData(IngredientTableData data) =>
      IngredientData(
        id: data.id,
        amount: data.amount,
        unit: $enumDecode(_$UnitEnumEnumMap, data.unit),
        groceryId: data.groceryId,
      );

  factory IngredientData.fromSupabase(Map<String, dynamic> data) =>
      IngredientData(
        id: data["id"],
        amount: (data["amount"] as num).toDouble(),
        unit: $enumDecode(_$UnitEnumEnumMap, data["unit"]),
        groceryId: data["grocery_id"],
      );

  static List<IngredientData> aggregateIngredients(
    Map<String, GroceryData> groceries,
    Iterable<IngredientData> ingredients,
  ) {
    final Map<String, IngredientData> ingredientsMap = {};
    for (final ingredient in ingredients) {
      final grocery = groceries[ingredient.groceryId]!;
      final data = ingredientsMap.putIfAbsent(
        ingredient.groceryId,
        () => IngredientData(
          id: "",
          amount: 0,
          unit: grocery.unit,
          groceryId: ingredient.groceryId,
        ),
      );
      ingredientsMap[ingredient.groceryId] = data.copyWith(
        amount:
            data.amount +
            grocery.convertToNorm(ingredient.amount, ingredient.unit),
      );
    }
    return ingredientsMap.values.toList();
  }
}

extension IngredientDataFunctions on IngredientData {
  String toReadable({
    required GroceryData grocery,
    required Map<UnitEnum, String> unitLocalized,
    required NumberFormat doubleNumberFormat,
  }) =>
      "${doubleNumberFormat.format(amount)}${unitLocalized[unit]} ${grocery.name}";

  IngredientTableCompanion toTableCompanion() =>
      IngredientTableCompanion.insert(
        id: id,
        amount: amount,
        unit: _$UnitEnumEnumMap[unit]!,
        groceryId: groceryId,
      );

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "amount": amount,
    "unit": _$UnitEnumEnumMap[unit]!,
    "grocery_id": groceryId,
  };
}
