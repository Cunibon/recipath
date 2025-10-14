import 'dart:ui';

import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/converters/color_converter.dart';
import 'package:recipath/drift/database.dart';

part 'tag_data.freezed.dart';
part 'tag_data.g.dart';

@freezed
abstract class TagData with _$TagData {
  const factory TagData({
    required String id,
    required String name,
    required String description,
    @ColorConverter() required Color color,
    @Default(false) bool deleted,
    @Default(false) bool uploaded,
  }) = _TagData;

  factory TagData.fromJson(Map<String, Object?> json) =>
      _$TagDataFromJson(json);

  factory TagData.fromTableData(TagTableData data) => TagData(
    id: data.id,
    name: data.name,
    description: data.description,
    color: Color(data.color),
    deleted: data.deleted,
    uploaded: data.uploaded,
  );

  factory TagData.fromSupabase(Map<String, dynamic> data) => TagData(
    id: data["id"],
    name: data["name"],
    description: data["description"],
    color: Color(data["color"]),
    deleted: data["deleted"],
    uploaded: true,
  );
}

extension TagDataFunctions on TagData {
  TagTableCompanion toTableCompanion() => TagTableCompanion.insert(
    id: id,
    name: name,
    description: description,
    color: color.toARGB32(),
    deleted: drift.Value(deleted),
    uploaded: drift.Value(uploaded),
  );

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "name": name,
    "description": description,
    "color": color.toARGB32(),
    "deleted": deleted,
  };

  TagData copyWithNewId() {
    return copyWith(id: randomAlphaNumeric(16));
  }
}
