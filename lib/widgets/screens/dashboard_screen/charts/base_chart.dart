import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/chart_entry.dart';

class BaseChart extends StatelessWidget {
  const BaseChart({
    required this.state,
    required this.horizontalInterval,
    required this.horizontalTitleInterval,
    this.axisSpace = 75,
    this.onTap,
    this.touchTooltipData,
    super.key,
  });

  final ChartState state;
  final double horizontalInterval;
  final double horizontalTitleInterval;

  final double axisSpace;

  final void Function(int? index)? onTap;
  final BarTouchTooltipData? touchTooltipData;

  final titlesStyle = const TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrained) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 8),
          child: SizedBox(
            width: max(constrained.maxWidth, state.entries.length * axisSpace),
            height: 350,
            child: BarChart(
              BarChartData(
                groupsSpace: axisSpace,
                maxY: state.maxY * 1.1,
                barTouchData: barTouchData(),
                titlesData: titlesData(),
                barGroups: state.entries.map((e) => e.groupData).toList(),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: horizontalInterval,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: value % horizontalTitleInterval == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSecondary,
                    dashArray: [5, 10],
                  ),
                ),
                alignment: BarChartAlignment.start,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarTouchData barTouchData() => BarTouchData(
    enabled: onTap != null,
    touchCallback: onTap != null
        ? (FlTouchEvent event, barTouchResponse) {
            if (event is FlTapUpEvent) {
              final spot = barTouchResponse?.spot;
              onTap!(spot?.touchedBarGroup.x);
            }
          }
        : null,
    touchTooltipData:
        touchTooltipData ??
        BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem:
              (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                final toolTip = state.entries.elementAtOrNull(groupIndex);
                if (toolTip != null) {
                  return BarTooltipItem(
                    state.entries[groupIndex].tooltip,
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }
                return null;
              },
        ),
  );

  FlTitlesData titlesData() => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 50,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        interval: horizontalTitleInterval,
        showTitles: true,
        reservedSize: 50,
        getTitlesWidget: (value, meta) =>
            SideTitleWidget(meta: meta, child: Text(value.toInt().toString())),
      ),
    ),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );

  Widget getTitles(double value, TitleMeta meta) {
    final index = value.toInt();
    if (index < 0 || index >= state.entries.length) {
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      meta: meta,
      angle: 0.45,
      child: Text(state.entries[index].title, style: titlesStyle),
    );
  }
}
