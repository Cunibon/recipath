import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifierFutureBuilder extends StatelessWidget {
  const NotifierFutureBuilder({
    required this.futures,
    required this.childBuilder,
    super.key,
  });

  final List<AsyncValue> futures;
  final Widget Function() childBuilder;

  @override
  Widget build(BuildContext context) {
    if (futures.any((e) => e.isLoading)) {
      return Center(child: CircularProgressIndicator());
    } else if (futures.any((e) => e.hasError)) {
      return Center(child: Text('Oops, something unexpected happened'));
    } else {
      return childBuilder();
    }
  }
}
