import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/drift/database.dart';

part 'recipe_tag_data.freezed.dart';
part 'recipe_tag_data.g.dart';

@freezed
abstract class RecipeTagData with _$RecipeTagData {
  const factory RecipeTagData({
    required String recipeId,
    required String tagId,
    @Default(false) bool deleted,
    @Default(false) bool uploaded,
  }) = _RecipeTagData;

  factory RecipeTagData.fromJson(Map<String, Object?> json) =>
      _$RecipeTagDataFromJson(json);

  factory RecipeTagData.fromTableData(RecipeTagTableData data) => RecipeTagData(
    recipeId: data.recipeId,
    tagId: data.tagId,
    deleted: data.deleted,
    uploaded: data.uploaded,
  );

  factory RecipeTagData.fromSupabase(Map<String, dynamic> data) =>
      RecipeTagData(
        recipeId: data["recipe_id"],
        tagId: data["tag_id"],
        deleted: data["deleted"],
        uploaded: true,
      );
}

extension TagDataFunctions on RecipeTagData {
  RecipeTagTableCompanion toTableCompanion() => RecipeTagTableCompanion.insert(
    recipeId: recipeId,
    tagId: tagId,
    deleted: drift.Value(deleted),
    uploaded: drift.Value(uploaded),
  );

  Map<String, dynamic> toSupabase() => {
    "recipe_id": recipeId,
    "tag_id": tagId,
    "deleted": deleted,
  };
}
