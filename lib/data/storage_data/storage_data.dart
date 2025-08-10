import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/drift/database.dart';

part 'storage_data.freezed.dart';
part 'storage_data.g.dart';

@freezed
abstract class StorageData with _$StorageData {
  const factory StorageData({
    required String id,
    required IngredientData ingredient,
    @Default(false) bool deleted,
    @Default(false) bool uploaded,
  }) = _StorageData;

  factory StorageData.fromJson(Map<String, Object?> json) =>
      _$StorageDataFromJson(json);

  factory StorageData.fromTableData(
    StorageTableData data,
    IngredientData ingredientData,
  ) => StorageData(
    id: data.id,
    ingredient: ingredientData,
    deleted: data.deleted,
    uploaded: data.uploaded,
  );

  factory StorageData.fromSupabase(
    Map<String, dynamic> data,
    IngredientData ingredient,
  ) => StorageData(
    id: data["id"],
    ingredient: ingredient,
    deleted: data["deleted"],
    uploaded: true,
  );
}

extension StorageDataFunctions on StorageData {
  StorageTableCompanion toTableCompanion() => StorageTableCompanion.insert(
    id: id,
    ingredientId: ingredient.id,
    deleted: drift.Value(deleted),
    uploaded: drift.Value(uploaded),
  );

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "ingredient_id": ingredient.id,
    "deleted": deleted,
  };

  StorageData copyWithNewId({Map<String, String> groceryLookup = const {}}) {
    return copyWith(
      id: randomAlphaNumeric(16),
      ingredient: ingredient.copyWith(
        id: randomAlphaNumeric(16),
        groceryId: groceryLookup[ingredient.groceryId] ?? ingredient.groceryId,
      ),
    );
  }
}
