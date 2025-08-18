import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';

class DurationPickerResponse {
  DurationPickerResponse({this.duration});

  final Duration? duration;
}

class DurationPickerDialog extends StatefulWidget {
  const DurationPickerDialog({required this.startDuration, super.key});

  final Duration startDuration;

  @override
  State<DurationPickerDialog> createState() => _DurationPickerDialogState();
}

class _DurationPickerDialogState extends State<DurationPickerDialog> {
  late Duration duration;

  @override
  void initState() {
    super.initState();
    duration = widget.startDuration;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(
        localization.howLongDidTheRecipeTake,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      content: DurationPicker(
        duration: duration,
        onChange: (val) {
          setState(() => duration = val);
        },
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.cancleTimer),
          onPressed: () {
            Navigator.of(context).pop(DurationPickerResponse());
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.done),
          onPressed: () {
            Navigator.of(
              context,
            ).pop(DurationPickerResponse(duration: duration));
          },
        ),
      ],
    );
  }
}
