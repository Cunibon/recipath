import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/chart_entry.dart';

class AsyncChart extends StatelessWidget {
  const AsyncChart({
    required this.asyncState,
    required this.builder,
    super.key,
  });

  final AsyncValue<ChartState> asyncState;
  final Widget Function(ChartState data) builder;

  @override
  Widget build(BuildContext context) => CachedAsyncValueWrapper(
    asyncState: asyncState,
    width: double.infinity,
    height: 358,
    builder: builder,
  );
}
