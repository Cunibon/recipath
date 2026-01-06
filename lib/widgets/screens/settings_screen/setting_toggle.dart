import 'package:flutter/material.dart';

class SettingToggle extends StatelessWidget {
  const SettingToggle({
    required this.text,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String text;
  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextTheme.of(context).titleMedium),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
