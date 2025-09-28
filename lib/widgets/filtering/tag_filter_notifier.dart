import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:recipath/widgets/filtering/filter_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_filter_notifier.g.dart';

@riverpod
class TagFilterNotifier extends _$TagFilterNotifier {
  static const tagFilterDataKey = "tagFilterDataKey";

  @override
  List<TagData> build(FilterTypes filterType) {
    final data =
        localStorage.get<List<dynamic>>(
          "$tagFilterDataKey${filterType.name}",
        ) ??
        [];

    return data.map((e) => TagData.fromJson(e)).toList();
  }

  void setFilters({required List<TagData> filters}) {
    state = filters;

    localStorage.setItem(
      "$tagFilterDataKey${filterType.name}",
      jsonEncode(state),
    );
    ref.invalidateSelf();
  }

  void clear() {
    localStorage.removeItem("$tagFilterDataKey${filterType.name}");
    ref.invalidateSelf();
  }
}
