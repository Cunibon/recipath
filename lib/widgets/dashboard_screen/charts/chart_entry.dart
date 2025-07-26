import 'package:fl_chart/fl_chart.dart';

class ChartEntry {
  ChartEntry({
    required this.groupData,
    required this.title,
    required this.tooltip,
  });

  final BarChartGroupData groupData;
  final String title;
  final String tooltip;
}

class ChartState {
  ChartState({required this.entries, required this.maxY});

  List<ChartEntry> entries;
  double maxY;
}
