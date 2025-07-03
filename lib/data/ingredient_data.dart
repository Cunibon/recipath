import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';

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
}

extension IngredientDataFunctions on IngredientData {
  String toReadable(GroceryData grocery) =>
      "${doubleNumberFormat.format(amount)}${unit.name} ${grocery.name}";
}
