import 'package:flutter/material.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/duration_picker_dialog.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({required this.minutes, required this.onChange, super.key});

  final int? minutes;
  final void Function(int? minutes) onChange;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final durationResponse = await showDialog<DurationPickerResponse>(
          context: context,
          builder: (context) => DurationPickerDialog(),
        );

        if (durationResponse == null) return;

        onChange(durationResponse.duration?.inMinutes);
      },
      //TODO localize
      label: Text(minutes == null ? "Add Timer" : "${minutes}m"),
      icon: Icon(Icons.timer),
    );
  }
}
