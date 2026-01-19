import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/unit_enum.dart';

part 'gtin_data.freezed.dart';

@freezed
abstract class GTINData with _$GTINData {
  const factory GTINData({
    required String barcode,
    required String name,
    required double amount,
    required UnitEnum unit,
    double? kcal,
    double? fat,
    double? carbs,
    double? protein,
    double? fiber,
  }) = _GTINData;

  static RegExp quantitiyRegEx = RegExp(r'^(\d+(?:[.,]\d+)?)([a-zA-Z]+)$');

  static GTINData? fromAPI(String barcode, Map<String, dynamic> json) {
    final product = json['product']!;

    final name = product['product_name'] ?? product["generic_name"];
    final quantity = product['quantity'];
    final nutriments = product['nutriments'];

    final kcal = nutriments?['energy-kcal_100g'] as num?;
    final fat = nutriments?['fat_100g'] as num?;
    final carbs = nutriments?['carbohydrates_100g'] as num?;
    final protein = nutriments?['proteins_100g'] as num?;
    final fiber = nutriments?['fiber_100g'] as num?;

    final match = quantity == null ? null : quantitiyRegEx.firstMatch(quantity);

    if (match != null) {
      final amountString = match.group(1)!;
      final unitString = match.group(2)!;
      final amount = double.tryParse(amountString.replaceAll(',', '.'));

      final unit = UnitEnum.values.firstWhere(
        (element) => element.name == unitString,
        orElse: () => UnitEnum.g,
      );

      return GTINData(
        barcode: barcode,
        name: name,
        amount: amount ?? 0,
        unit: unit,
        kcal: kcal?.toDouble(),
        fat: fat?.toDouble(),
        carbs: carbs?.toDouble(),
        protein: protein?.toDouble(),
        fiber: fiber?.toDouble(),
      );
    }
    return null;
  }
}
