import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_filter_notifier.g.dart';

@riverpod
class QuickFilterNotifier extends _$QuickFilterNotifier {
  static const quickFilterDataKey = "quickFilterDataKey";

  @override
  Map<QuickFilters, bool> build() {
    final data =
        localStorage.get<Map<String, dynamic>>(quickFilterDataKey) ?? {};

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
      quickFilterDataKey,
      jsonEncode(
        state.map((key, value) => MapEntry(_$QuickFiltersEnumMap[key], value)),
      ),
    );
    ref.invalidateSelf();
  }

  void clear() {
    localStorage.removeItem(quickFilterDataKey);
    ref.invalidateSelf();
  }
}

@JsonEnum(alwaysCreate: true)
enum QuickFilters {
  running(icon: Icons.timer),
  cookable(icon: Icons.restaurant);

  const QuickFilters({required this.icon});
  final IconData icon;
}
