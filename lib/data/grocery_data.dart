import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/unit_enum.dart';

part 'grocery_data.freezed.dart';
part 'grocery_data.g.dart';

@freezed
abstract class GroceryData with _$GroceryData {
  const factory GroceryData({
    required String id,
    required double normalAmount,
    required UnitEnum unit,
    required String name,
  }) = _GroceryData;

  factory GroceryData.fromJson(Map<String, Object?> json) =>
      _$GroceryDataFromJson(json);
}

extension GroceryDataFunctions on GroceryData {
  String toReadable() => "$normalAmount${unit.name} $name";
}
