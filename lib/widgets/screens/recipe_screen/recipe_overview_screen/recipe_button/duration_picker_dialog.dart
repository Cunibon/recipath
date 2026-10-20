import 'package:duration_picker/duration_picker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';

class DurationPickerResponse {
  DurationPickerResponse({this.duration});

  final Duration? duration;
}

class DurationPickerDialog extends StatefulWidget {
  const DurationPickerDialog({
    required this.title,
    this.startDuration = const Duration(),
    super.key,
  });

  final String title;
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
    final colorScheme = ColorScheme.of(context);

    return AlertDialog(
      title: Text(widget.title),
      content: CustomPaint(
        painter: _DialFillPainter(colorScheme.surface),
        child: DurationPicker(
          theme: DurationPickerThemeData(
            dialBackgroundColor: colorScheme.surface,
            handColor: colorScheme.secondary,
            valueTextStyle: TextStyle(color: colorScheme.onSurface),
            unitTextStyle: TextStyle(color: colorScheme.onSurface),
            labelTextStyle: TextStyle(color: colorScheme.onSurface),
          ),
          duration: duration,
          onChange: (val) {
            setState(() => duration = val);
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text(localization.cancelTimer),
          onPressed: () {
            Navigator.of(context).pop(DurationPickerResponse());
          },
        ),
        TextButton(
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

class _DialFillPainter extends CustomPainter {
  _DialFillPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      size.center(Offset.zero),
      size.shortestSide / 2,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(_DialFillPainter oldDelegate) =>
      oldDelegate.color != color;
}
