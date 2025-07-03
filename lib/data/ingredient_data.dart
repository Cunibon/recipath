import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/grocery_data.dart';

part 'ingredient_data.freezed.dart';
part 'ingredient_data.g.dart';

@freezed
abstract class IngredientData with _$IngredientData {
  const factory IngredientData({
    required String id,
    required double amount,
    required String groceryId,
  }) = _IngredientData;

  factory IngredientData.fromJson(Map<String, Object?> json) =>
      _$IngredientDataFromJson(json);
}

extension IngredientDataFunctions on IngredientData {
  String toReadable(Map<String, GroceryData> groceryMap) =>
      "$amount${groceryMap[groceryId]!.unit.name} ${groceryMap[groceryId]!.name}";
}
