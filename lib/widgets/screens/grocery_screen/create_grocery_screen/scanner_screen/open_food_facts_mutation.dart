import 'dart:convert';

import 'package:bound_mutation/bound_mutation.dart';
import 'package:http/http.dart' as http;
import 'package:recipath/data/gtin_data/gtin_data.dart';

final openFoodFactsMutation = BoundMutation<GTINData?, String>((
  transaction,
  barcode,
) async {
  final url = Uri.parse(
    'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
  );

  final response = await http.get(url).timeout(const Duration(seconds: 15));

  if (response.statusCode != 200 && response.statusCode != 404) {
    throw OpenFoodFactsRequestException(response.statusCode);
  }

  final Object? data;
  try {
    data = jsonDecode(response.body);
  } on FormatException {
    throw const OpenFoodFactsInvalidResponseException();
  }

  if (data is! Map<String, dynamic>) {
    throw const OpenFoodFactsInvalidResponseException();
  }

  final statusVerbose = data['status_verbose'];
  if (statusVerbose is String &&
      statusVerbose.contains('different product type')) {
    throw OpenFoodFactsDifferentProductTypeException(barcode);
  }

  if (response.statusCode != 200) {
    throw OpenFoodFactsRequestException(response.statusCode);
  }

  if (data['status'] == 0 || data['product'] == null) {
    throw OpenFoodFactsProductNotFoundException(barcode);
  }

  return GTINData.fromAPI(barcode, data);
});

sealed class OpenFoodFactsException implements Exception {
  const OpenFoodFactsException();
}

final class OpenFoodFactsRequestException extends OpenFoodFactsException {
  const OpenFoodFactsRequestException(this.statusCode);

  final int statusCode;

  @override
  String toString() => 'OpenFoodFactsRequestException(statusCode: $statusCode)';
}

final class OpenFoodFactsInvalidResponseException
    extends OpenFoodFactsException {
  const OpenFoodFactsInvalidResponseException();

  @override
  String toString() => 'OpenFoodFactsInvalidResponseException';
}

final class OpenFoodFactsProductNotFoundException
    extends OpenFoodFactsException {
  const OpenFoodFactsProductNotFoundException(this.barcode);

  final String barcode;

  @override
  String toString() =>
      'OpenFoodFactsProductNotFoundException(barcode: $barcode)';
}

final class OpenFoodFactsDifferentProductTypeException
    extends OpenFoodFactsException {
  const OpenFoodFactsDifferentProductTypeException(this.barcode);

  final String barcode;

  @override
  String toString() =>
      'OpenFoodFactsDifferentProductTypeException(barcode: $barcode)';
}
