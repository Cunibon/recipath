import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/repos/tag/tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_notifier.g.dart';

@riverpod
Stream<IMap<String, TagData>> tagNotifier(Ref ref) =>
    ref.watch(tagRepoProvider).stream();
