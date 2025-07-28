import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/chart_entry.dart';

class AsyncChart extends StatefulWidget {
  const AsyncChart({
    required this.asyncState,
    required this.horizontalInterval,
    required this.horizontalTitleInterval,
    this.onTap,
    this.axisSpace = 75,
    super.key,
  });

  final AsyncValue<ChartState> asyncState;
  final double horizontalInterval;
  final double horizontalTitleInterval;

  final double axisSpace;

  final void Function(int? index)? onTap;

  @override
  State<AsyncChart> createState() => _AsyncChartState();
}

class _AsyncChartState extends State<AsyncChart> {
  ChartState? lastState;

  @override
  Widget build(BuildContext context) {
    if (widget.asyncState.hasValue) {
      lastState = widget.asyncState.value;
    }

    if (lastState != null || widget.asyncState.hasValue) {
      return BaseChart(
        state: lastState!,
        horizontalInterval: widget.horizontalInterval,
        horizontalTitleInterval: widget.horizontalTitleInterval,
        onTap: widget.onTap,
        axisSpace: widget.axisSpace,
      );
    } else if (widget.asyncState.hasError) {
      return SizedBox(
        width: double.infinity,
        height: 358,
        child: Center(child: const Text('Oops, something unexpected happened')),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        height: 358,
        child: Center(child: const CircularProgressIndicator()),
      );
    }
  }
}
