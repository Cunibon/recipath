import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/widgets/screens/history_screen/data/history_data.dart';

class HistoryScreenData {
  HistoryScreenData({
    required this.groupedHistoryData,
    required this.groceryMap,
  });

  Map<DateTime, List<HistoryData>> groupedHistoryData;
  final Map<String, GroceryData> groceryMap;
}
