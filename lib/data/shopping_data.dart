import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';

part 'shopping_data.freezed.dart';
part 'shopping_data.g.dart';

@freezed
abstract class ShoppingData with _$ShoppingData {
  const factory ShoppingData({
    required String id,
    required bool done,
    required int count,
    required IngredientData ingredient,
  }) = _ShoppingData;

  factory ShoppingData.fromJson(Map<String, Object?> json) =>
      _$ShoppingDataFromJson(json);
}

extension ShoppingDataFunctions on ShoppingData {
  String toReadable(GroceryData grocery, double storageData) =>
      "${count}x ${grocery.toReadable()} (${doubleNumberFormat.format(ingredient.amount)}${grocery.unit.name}/${doubleNumberFormat.format(storageData)}${grocery.unit.name})";
}
