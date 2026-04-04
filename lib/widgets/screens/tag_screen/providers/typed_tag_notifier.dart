import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'typed_tag_notifier.g.dart';

@riverpod
Future<Map<TagTypeEnum, Map<String, TagData>>> typedTagNotifier(Ref ref) async {
  final tags = await ref.watch(tagProvider.future);

  final typedTags = <TagTypeEnum, Map<String, TagData>>{
    for (final tagType in TagTypeEnum.values) tagType: {},
  };

  for (final tag in tags.values) {
    typedTags[tag.tagType]![tag.id] = tag;
  }

  return typedTags;
}
