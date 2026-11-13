import 'dart:async';

import 'package:material_ui/material_ui.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    required this.onChanged,
    this.decoration,
    this.controller,
    this.debounceMS = 200,
    super.key,
  });

  final void Function(String value) onChanged;
  final InputDecoration? decoration;
  final TextEditingController? controller;

  final int debounceMS;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final controller = widget.controller ?? TextEditingController();
  Timer? timer;

  void debounce() {
    timer?.cancel();

    timer = Timer(
      Duration(milliseconds: widget.debounceMS),
      () => widget.onChanged(controller.text),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        return TextField(
          onChanged: (_) => debounce(),
          decoration: (widget.decoration ?? const InputDecoration()).copyWith(
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      controller.clear();
                      widget.onChanged(controller.text);
                    },
                  ),
          ),
          controller: controller,
        );
      },
    );
  }
}
