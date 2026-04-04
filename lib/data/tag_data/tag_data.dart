import 'dart:ui';

import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/converters/color_converter.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/drift/database.dart';

part 'tag_data.freezed.dart';
part 'tag_data.g.dart';

@freezed
abstract class TagData with _$TagData {
  const factory TagData({
    required String id,
    required String name,
    required String description,
    required TagTypeEnum tagType,
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
    tagType: $enumDecode(_$TagTypeEnumEnumMap, data.tagType),
    deleted: data.deleted,
    uploaded: data.uploaded,
  );
}

extension TagDataFunctions on TagData {
  TagTableCompanion toTableCompanion() => TagTableCompanion.insert(
    id: id,
    name: name,
    description: description,
    color: color.toARGB32(),
    tagType: drift.Value(_$TagTypeEnumEnumMap[tagType]!),
    deleted: drift.Value(deleted),
    uploaded: drift.Value(uploaded),
  );

  TagData copyWithNewId() {
    return copyWith(id: randomAlphaNumeric(16));
  }
}
