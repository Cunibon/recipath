import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/drift/database.dart';

part 'grocery_tag_data.freezed.dart';
part 'grocery_tag_data.g.dart';

@freezed
abstract class GroceryTagData with _$GroceryTagData {
  const factory GroceryTagData({
    required String groceryId,
    required String tagId,
    @Default(false) bool deleted,
    @Default(false) bool uploaded,
  }) = _GroceryTagData;

  factory GroceryTagData.fromJson(Map<String, Object?> json) =>
      _$GroceryTagDataFromJson(json);

  factory GroceryTagData.fromTableData(GroceryTagTableData data) =>
      GroceryTagData(
        groceryId: data.groceryId,
        tagId: data.tagId,
        deleted: data.deleted,
        uploaded: data.uploaded,
      );
}

extension TagDataFunctions on GroceryTagData {
  GroceryTagTableCompanion toTableCompanion() =>
      GroceryTagTableCompanion.insert(
        groceryId: groceryId,
        tagId: tagId,
        deleted: drift.Value(deleted),
        uploaded: drift.Value(uploaded),
      );
}
