import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CachedAsyncValueWrapper<T> extends StatefulWidget {
  const CachedAsyncValueWrapper({
    required this.asyncState,
    required this.builder,
    this.width,
    this.height,
    super.key,
  });

  final AsyncValue<T> asyncState;
  final Widget Function(T data) builder;

  final double? width;
  final double? height;

  @override
  State<CachedAsyncValueWrapper<T>> createState() =>
      _CachedAsyncValueWrapperState();
}

class _CachedAsyncValueWrapperState<T>
    extends State<CachedAsyncValueWrapper<T>> {
  T? lastState;

  @override
  Widget build(BuildContext context) {
    if (widget.asyncState.hasValue) {
      lastState = widget.asyncState.value;
    }

    if (lastState != null) {
      return widget.builder(lastState as T);
    } else if (widget.asyncState.hasError) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(child: const Text('Oops, something unexpected happened')),
      );
    } else {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(child: const CircularProgressIndicator()),
      );
    }
  }
}
