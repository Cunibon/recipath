import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:recipath/l10n/app_localizations.dart';

class SelectColorDialog extends StatefulWidget {
  const SelectColorDialog({this.initialColor, super.key});
  final Color? initialColor;

  @override
  State<SelectColorDialog> createState() => _SelectColorDialogState();
}

class _SelectColorDialogState extends State<SelectColorDialog> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.initialColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      content: SingleChildScrollView(
        child: IntrinsicHeight(
          child: ColorPicker(
            paletteType: PaletteType.hueWheel,
            enableAlpha: false,
            hexInputBar: true,
            labelTypes: [],
            pickerColor: color,
            onColorChanged: (value) => setState(() => color = value),
          ),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.discard),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.pick),
          onPressed: () {
            Navigator.pop(context, color);
          },
        ),
      ],
    );
  }
}
