import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

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
    return AlertDialog(
      title: Text(
        "How long did your recipe take?",
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
          child: const Text('Cancle timer'),
          onPressed: () {
            Navigator.of(context).pop(DurationPickerResponse());
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Done'),
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
