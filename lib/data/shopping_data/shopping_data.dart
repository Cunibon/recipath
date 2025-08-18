import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
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
    @Default(false) bool deleted,
    @Default(false) bool uploaded,
  }) = _ShoppingData;

  factory ShoppingData.fromJson(Map<String, Object?> json) =>
      _$ShoppingDataFromJson(json);

  factory ShoppingData.fromTableData(
    ShoppingTableData data,
    IngredientData ingredientData,
  ) => ShoppingData(
    id: data.id,
    done: data.done,
    count: data.count,
    ingredient: ingredientData,
    deleted: data.deleted,
    uploaded: data.uploaded,
  );

  factory ShoppingData.fromSupabase(
    Map<String, dynamic> data,
    IngredientData ingredient,
  ) => ShoppingData(
    id: data["id"],
    done: data["done"],
    count: data["count"],
    ingredient: ingredient,
    deleted: data["deleted"],
    uploaded: true,
  );
}

extension ShoppingDataFunctions on ShoppingData {
  String toReadable(
    GroceryData grocery,
    double storageData,
    Map<UnitEnum, String> unitLocalized,
  ) =>
      "${count}x ${grocery.toReadable(unitLocalized)} (${doubleNumberFormat.format(ingredient.amount)}${unitLocalized[grocery.unit]}/${doubleNumberFormat.format(storageData)}${unitLocalized[grocery.unit]})";

  ShoppingTableCompanion toTableCompanion() => ShoppingTableCompanion.insert(
    id: id,
    done: done,
    count: count,
    ingredientId: ingredient.id,
    deleted: drift.Value(deleted),
    uploaded: drift.Value(uploaded),
  );

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "done": done,
    "count": count,
    "ingredient_id": ingredient.id,
    "deleted": deleted,
  };

  ShoppingData copyWithNewId({Map<String, String> groceryLookup = const {}}) {
    return copyWith(
      id: randomAlphaNumeric(16),
      ingredient: ingredient.copyWith(
        id: randomAlphaNumeric(16),
        groceryId: groceryLookup[ingredient.groceryId] ?? ingredient.groceryId,
      ),
    );
  }
}
