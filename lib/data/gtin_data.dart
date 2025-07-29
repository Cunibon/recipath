import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/unit_enum.dart';

part 'gtin_data.freezed.dart';
part 'gtin_data.g.dart';

@freezed
abstract class GTINData with _$GTINData {
  const factory GTINData({
    required String name,
    required double amount,
    required UnitEnum unit,
    double? kcal,
  }) = _GTINData;

  static RegExp quantitiyRegEx = RegExp(r'^(\d+(?:[.,]\d+)?)([a-zA-Z]+)$');

  factory GTINData.fromJson(Map<String, Object?> json) =>
      _$GTINDataFromJson(json);

  static GTINData? fromAPI(Map<String, dynamic> json) {
    final product = json['product']!;

    final name = product['product_name'] ?? product["generic_name"];
    final quantity = product['quantity'];
    final kcalPer100g = product['nutriments']?['energy-kcal_100g'] as num?;

    final match = quantitiyRegEx.firstMatch(quantity);

    if (match != null) {
      final amountString = match.group(1)!;
      final unitString = match.group(2)!;
      final amount = double.tryParse(amountString.replaceAll(',', '.'));

      final unit = UnitEnum.values.firstWhere(
        (element) => element.name == unitString,
        orElse: () => UnitEnum.g,
      );

      return GTINData(
        name: name,
        amount: amount ?? 0,
        unit: unit,
        kcal: kcalPer100g?.toDouble(),
      );
    }
    return null;
  }
}
