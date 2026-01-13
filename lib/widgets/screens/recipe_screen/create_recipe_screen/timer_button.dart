import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/duration_picker_dialog.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({required this.minutes, required this.onChange, super.key});

  final int? minutes;
  final void Function(int? minutes) onChange;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TextButton.icon(
      onPressed: () async {
        final durationResponse = await showDialog<DurationPickerResponse>(
          context: context,
          builder: (context) =>
              DurationPickerDialog(title: localization.howLongWillTheStepTake),
        );

        if (durationResponse == null) return;

        onChange(durationResponse.duration?.inMinutes);
      },
      label: Text(minutes == null ? localization.addTimer : "${minutes}m"),
      icon: Icon(Icons.timer),
    );
  }
}
