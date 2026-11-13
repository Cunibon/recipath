import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/quick_filter_data.dart';
import 'package:recipath/widgets/filtering/quick_filter_enum.dart';

class QuickFilterButton extends StatelessWidget {
  const QuickFilterButton({
    required this.filter,
    required this.onTap,
    super.key,
  });
  final QuickFilterData filter;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return IconButton(
      onPressed: onTap,
      tooltip: tooltipFilters(localization)[filter.quickFilter]!,
      icon: Icon(
        filter.quickFilter.icon,
        color: filter.active ? Colors.amber : null,
        size: 28,
      ),
    );
  }
}
