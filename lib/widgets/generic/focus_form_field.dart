import 'package:flutter/material.dart';

class FocusFormField extends StatefulWidget {
  const FocusFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.onFocusLost,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final void Function(String value)? onChanged;

  final void Function(String value)? onFocusLost;

  @override
  State<FocusFormField> createState() => _FocusFormFieldState();
}

class _FocusFormFieldState extends State<FocusFormField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onFocusLost?.call(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _controller,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
    );
  }
}
