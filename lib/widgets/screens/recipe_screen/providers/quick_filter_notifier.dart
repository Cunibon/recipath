import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:recipath/widgets/filtering/filter_type_enum.dart';
import 'package:recipath/widgets/filtering/quick_filter_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_filter_notifier.g.dart';

@riverpod
class QuickFilterNotifier extends _$QuickFilterNotifier {
  static const quickFilterDataKey = "quickFilterDataKey_v2";

  String get _dataKey => "${quickFilterDataKey}_${filterType.name}";

  @override
  Map<QuickFilters, bool> build(FilterTypeEnum filterType) {
    final data = localStorage.get<Map<String, dynamic>>(_dataKey) ?? {};

    return data.map(
      (key, value) => MapEntry(QuickFilters.fromEncoded(key), value),
    );
  }

  void setFilter({required QuickFilters filter, required bool value}) {
    state[filter] = value;

    localStorage.setItem(
      _dataKey,
      jsonEncode(
        state.map((key, value) => MapEntry(QuickFilters.toEncoded(key), value)),
      ),
    );
    ref.invalidateSelf();
  }

  void clear() {
    localStorage.removeItem(_dataKey);
    ref.invalidateSelf();
  }
}
