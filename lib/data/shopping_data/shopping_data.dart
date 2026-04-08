import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/drift/database.dart';

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
}

extension ShoppingDataFunctions on ShoppingData {
  ShoppingTableCompanion toTableCompanion() => ShoppingTableCompanion.insert(
    id: id,
    done: done,
    count: count,
    ingredientId: ingredient.id,
    deleted: drift.Value(deleted),
    uploaded: drift.Value(uploaded),
  );
}
