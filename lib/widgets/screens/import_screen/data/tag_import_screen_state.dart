import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/tag_data/tag_data.dart';

part 'tag_import_screen_state.freezed.dart';

@freezed
abstract class TagImportScreenState with _$TagImportScreenState {
  const factory TagImportScreenState({
    required Map<String, TagData> tagLookup,
    required Map<String, TagData?> mappedTags,
  }) = _TagImportScreenState;
}
