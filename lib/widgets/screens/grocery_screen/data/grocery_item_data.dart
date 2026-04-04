import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';

class GroceryItemData {
  GroceryItemData({required this.groceryData, required this.tags});

  final GroceryData groceryData;
  final Set<TagData> tags;
}
