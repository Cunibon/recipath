import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_by_type_notifier.g.dart';

@riverpod
Future<IMap<TagTypeEnum, IMap<String, TagData>>> tagByTypeNotifier(
  Ref ref,
) async {
  final tags = await ref.watch(tagProvider.future);

  final typedTags = <TagTypeEnum, Map<String, TagData>>{
    for (final tagType in TagTypeEnum.values) tagType: {},
  };

  for (final tag in tags.values) {
    typedTags[tag.tagType]![tag.id] = tag;
  }

  return typedTags.map((key, value) => MapEntry(key, value.lock)).lock;
}
