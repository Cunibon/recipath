import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';

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

Map<QuickFilters, String> tooltipFilters(AppLocalizations localization) => {
  QuickFilters.running: localization.quickFilterRunning,
  QuickFilters.cookable: localization.quickFilterCookable,
  QuickFilters.cluster: localization.quickFilterCluster,
  QuickFilters.unused: localization.quickFilterUnused,
  QuickFilters.available: localization.quickFilterAvailable,
  QuickFilters.shopping: localization.quickFilterShopping,
};
