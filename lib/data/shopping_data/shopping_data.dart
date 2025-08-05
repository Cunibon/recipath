import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/drift/database.dart';

part 'shopping_data.freezed.dart';
part 'shopping_data.g.dart';

@freezed
abstract class ShoppingData with _$ShoppingData {
  const factory ShoppingData({
    required String id,
    required bool done,
    required int count,
    required IngredientData ingredient,
    required bool uploaded,
  }) = _ShoppingData;

  factory ShoppingData.fromJson(Map<String, Object?> json) =>
      _$ShoppingDataFromJson(json);

  factory ShoppingData.fromSupabase(
    Map<String, dynamic> data,
    IngredientData ingredient,
  ) => ShoppingData(
    id: data["id"],
    done: data["done"],
    count: data["count"],
    ingredient: ingredient,
    uploaded: true,
  );
}

extension ShoppingDataFunctions on ShoppingData {
  String toReadable(GroceryData grocery, double storageData) =>
      "${count}x ${grocery.toReadable()} (${doubleNumberFormat.format(ingredient.amount)}${grocery.unit.name}/${doubleNumberFormat.format(storageData)}${grocery.unit.name})";

  ShoppingTableCompanion toTableCompanion() => ShoppingTableCompanion.insert(
    id: id,
    done: done,
    count: count,
    ingredientId: ingredient.id,
    uploaded: drift.Value(uploaded),
  );

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "done": done,
    "count": count,
    "ingredient_id": ingredient.id,
  };
}
