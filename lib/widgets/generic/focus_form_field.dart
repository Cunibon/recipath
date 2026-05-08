import 'package:flutter/material.dart';

class FocusFormField extends StatefulWidget {
  const FocusFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.decoration = const InputDecoration(),
    this.textCapitalization = .none,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.autovalidateMode,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.onFocusLost,
    this.selectOnEnter = false,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final InputDecoration? decoration;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final void Function(String value)? onChanged;

  final void Function(String value)? onFocusLost;
  final bool selectOnEnter;

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
      } else if (widget.selectOnEnter) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
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
      textCapitalization: .sentences,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      autovalidateMode: widget.autovalidateMode,
      validator: widget.validator,
      onEditingComplete: () {
        _focusNode.unfocus();
        widget.onEditingComplete?.call();
      },
      onChanged: widget.onChanged,
    );
  }
}
