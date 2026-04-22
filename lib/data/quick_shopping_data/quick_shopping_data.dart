import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/drift/database.dart';

part 'quick_shopping_data.freezed.dart';
part 'quick_shopping_data.g.dart';

@freezed
abstract class QuickShoppingData with _$QuickShoppingData {
  const factory QuickShoppingData({
    required String id,
    required bool done,
    required String description,
    @Default(false) bool deleted,
    @Default(false) bool uploaded,
  }) = _QuickShoppingData;

  factory QuickShoppingData.fromJson(Map<String, Object?> json) =>
      _$QuickShoppingDataFromJson(json);

  factory QuickShoppingData.fromTableData(QuickShoppingTableData data) =>
      QuickShoppingData(
        id: data.id,
        done: data.done,
        description: data.description,
        deleted: data.deleted,
        uploaded: data.uploaded,
      );
}

extension QuickShoppingDataFunctions on QuickShoppingData {
  String toReadable() => description;

  QuickShoppingTableCompanion toTableCompanion() =>
      QuickShoppingTableCompanion.insert(
        id: id,
        done: done,
        description: description,
        deleted: drift.Value(deleted),
        uploaded: drift.Value(uploaded),
      );
}
