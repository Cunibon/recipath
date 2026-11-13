import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_ui/material_ui.dart';

part 'quick_filter_enum.g.dart';

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

  factory QuickFilters.fromEncoded(String key) =>
      _$QuickFiltersEnumMap.entries.firstWhere((e) => e.value == key).key;

  static String toEncoded(QuickFilters filter) =>
      _$QuickFiltersEnumMap[filter]!;
}
