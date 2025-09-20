import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';

class DoubleInputField extends ConsumerWidget {
  const DoubleInputField({
    super.key,
    this.controller,
    required this.labelText,
    required this.validatorText,
    required this.onChanged,
  });

  final TextEditingController? controller;
  final String labelText;

  final String validatorText;
  final void Function(double? parsed) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      validator: (value) => value?.isEmpty == false
          ? doubleNumberFormat.tryParse(value!) == null
                ? validatorText
                : null
          : null,
      onChanged: (value) {
        final parsed = doubleNumberFormat.tryParse(value)?.toDouble();
        onChanged(parsed);
      },
    );
  }
}
