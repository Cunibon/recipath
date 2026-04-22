import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_filter_notifier.g.dart';

@riverpod
class TagFilterNotifier extends _$TagFilterNotifier {
  static const tagFilterDataKey = "tagFilterDataKey";

  String get dataKey => "${tagFilterDataKey}_${filterType.name}";

  @override
  Set<String> build(TagTypeEnum filterType) {
    final data = localStorage.get<List<dynamic>>(dataKey) ?? [];

    return data.cast<String>().toSet();
  }

  void setFilters({required List<TagData> filters}) {
    state = filters.map((e) => e.id).toSet();

    _saveState();
  }

  void toggleFilter({required TagData filter}) {
    if (state.contains(filter.id)) {
      state = Set.from(state)..remove(filter.id);
    } else {
      state = Set.from(state)..add(filter.id);
    }

    _saveState();
  }

  void _saveState() {
    localStorage.setItem(dataKey, jsonEncode(state.toList()));
    ref.invalidateSelf();
  }

  void clear() {
    localStorage.removeItem(dataKey);
    ref.invalidateSelf();
  }
}
