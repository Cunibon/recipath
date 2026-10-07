import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/widgets/filtering/filter_type_enum.dart';
import 'package:recipath/helper/local_storage_extension.dart';
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
      (key, value) => MapEntry(
        _$QuickFiltersEnumMap.entries.firstWhere((e) => e.value == key).key,
        value,
      ),
    );
  }

  void setFilter({required QuickFilters filter, required bool value}) {
    state[filter] = value;

    localStorage.setItem(
      _dataKey,
      jsonEncode(
        state.map((key, value) => MapEntry(_$QuickFiltersEnumMap[key], value)),
      ),
    );
    ref.invalidateSelf();
  }

  void clear() {
    localStorage.removeItem(_dataKey);
    ref.invalidateSelf();
  }
}

@JsonEnum(alwaysCreate: true)
enum QuickFilters {
  running(icon: Icons.timer),
  cookable(icon: Icons.restaurant),
  cluster(icon: Icons.blur_on),
  unused(icon: Icons.cleaning_services),
  available(icon: Icons.shelves),
  shopping(icon: Icons.shopping_basket);

  const QuickFilters({required this.icon});
  final IconData icon;
}
