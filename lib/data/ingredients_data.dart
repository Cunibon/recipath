import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/grocery_data.dart';

part 'ingredients_data.freezed.dart';
part 'ingredients_data.g.dart';

@freezed
abstract class IngredientsData with _$IngredientsData {
  const factory IngredientsData({
    required String id,
    required double amount,
    required String groceryId,
  }) = _IngredientsData;

  factory IngredientsData.fromJson(Map<String, Object?> json) =>
      _$IngredientsDataFromJson(json);
}

extension IngredientsDataFunctions on IngredientsData {
  String toReadable() => "$amount${grocery.unit.name} ${grocery.name}";
}
