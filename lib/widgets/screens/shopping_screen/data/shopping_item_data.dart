import 'package:intl/intl.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/unit_enum.dart';

enum ShoppingTypeEnum { normal, quick, done }

sealed class BaseShoppingItemData {
  BaseShoppingItemData();

  bool get done;
}

class ShoppingItemData extends BaseShoppingItemData {
  ShoppingItemData({required this.data});

  final ShoppingData data;

  @override
  bool get done => data.done;

  String toReadable({
    required GroceryData grocery,
    required Map<UnitEnum, String> unitLocalized,
    required NumberFormat doubleNumberFormat,
  }) =>
      "${data.count}x ${grocery.toReadable(unitLocalized: unitLocalized, doubleNumberFormat: doubleNumberFormat)} (${doubleNumberFormat.format(data.ingredient.amount)}${unitLocalized[grocery.unit]})";
}

class QuickShoppingItemData extends BaseShoppingItemData {
  QuickShoppingItemData({required this.data});

  final QuickShoppingData data;

  @override
  bool get done => data.done;

  String toReadable() => data.description;
}
