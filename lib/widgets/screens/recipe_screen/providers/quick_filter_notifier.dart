import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_filter_notifier.g.dart';

@riverpod
class QuickFilterNotifier extends _$QuickFilterNotifier {
  static const quickFilterDataKey = "quickFilterDataKey_v2";

  String get dataKey => "${quickFilterDataKey}_${filterType.name}";

  @override
  Map<QuickFilters, bool> build(TagTypeEnum filterType) {
    final data = localStorage.get<Map<String, dynamic>>(dataKey) ?? {};

    return data.map(
      (key, value) => MapEntry(
        _$QuickFiltersEnumMap.entries.firstWhere((e) => e.value == key).key,
        value,
      ),
    );
  }

  void setFilter({required QuickFilters filter, required bool value}) {
    state[filter] = value;

    localStorage.setItem(
      dataKey,
      jsonEncode(
        state.map((key, value) => MapEntry(_$QuickFiltersEnumMap[key], value)),
      ),
    );
    ref.invalidateSelf();
  }

  void clear() {
    localStorage.removeItem(dataKey);
    ref.invalidateSelf();
  }
}

@JsonEnum(alwaysCreate: true)
enum QuickFilters {
  running(icon: Icons.timer),
  cookable(icon: Icons.restaurant),
  cluster(icon: Icons.blur_on);

  const QuickFilters({required this.icon});
  final IconData icon;
}
