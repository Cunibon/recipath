import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';

enum OpenFoodFactsCredentialsStatus { valid, invalid, failure }

class OpenFoodFactsService {
  static final Uri _uploadUri = Uri.parse(
    'https://world.openfoodfacts.org/cgi/product_jqm2.pl',
  );
  static final Uri _authUri = Uri.parse(
    'https://world.openfoodfacts.org/cgi/auth.pl',
  );
  static const String _contactUrl = 'https://github.com/Cunibon/recipath';

  OpenFoodFactsService({
    required this.client,
    required this.appVersion,
    this.requestTimeout = const Duration(seconds: 15),
  });

  final http.Client client;
  final String appVersion;
  final Duration requestTimeout;

  Future<OpenFoodFactsCredentialsStatus> validateCredentials({
    required OpenFoodFactsAccountData account,
  }) async {
    if (account.username.isEmpty || account.password.isEmpty) {
      return OpenFoodFactsCredentialsStatus.invalid;
    }

    final headers = {
      'User-Agent': appVersion.isEmpty
          ? '$appName ($_contactUrl)'
          : '$appName/$appVersion ($_contactUrl)',
    };
    final body = <String, String>{
      'user_id': account.username,
      'password': account.password,
      'body': '1',
    };

    try {
      final response = await client
          .post(_authUri, headers: headers, body: body)
          .timeout(requestTimeout);

      if (response.statusCode != 200 && response.statusCode != 403) {
        return OpenFoodFactsCredentialsStatus.failure;
      }

      final data = jsonDecode(response.body);
      if (data is! Map<String, dynamic>) {
        return OpenFoodFactsCredentialsStatus.failure;
      }

      return data['status'] == 1
          ? OpenFoodFactsCredentialsStatus.valid
          : OpenFoodFactsCredentialsStatus.invalid;
    } catch (_) {
      return OpenFoodFactsCredentialsStatus.failure;
    }
  }

  Future<bool> uploadProduct({
    required OpenFoodFactsAccountData account,
    required GroceryData grocery,
  }) async {
    final barcode = grocery.barcode?.trim();
    final productName = grocery.name.trim();
    final trimmedAppVersion = appVersion.trim();

    if (barcode == null ||
        barcode.isEmpty ||
        productName.isEmpty ||
        trimmedAppVersion.isEmpty) {
      return false;
    }

    try {
      final body = <String, String>{
        'code': barcode,
        'product_name': productName,
        'quantity': '${grocery.normalAmount} ${grocery.unit.name}',
        'user_id': account.username,
        'password': account.password,
        'app_uuid': account.appUuid,
        'app_name': appName,
        'app_version': trimmedAppVersion,
      };

      if (grocery.kcal?.isFinite == true) {
        body['nutriment_energy-kcal_100g'] = grocery.kcal!.toStringAsFixed(2);
        body['nutriment_energy-kcal_unit'] = 'kcal';
      }
      if (grocery.fat?.isFinite == true) {
        body['nutriment_fat_100g'] = grocery.fat!.toStringAsFixed(2);
        body['nutriment_fat_unit'] = 'g';
      }
      if (grocery.carbs?.isFinite == true) {
        body['nutriment_carbohydrates_100g'] = grocery.carbs!.toStringAsFixed(
          2,
        );
        body['nutriment_carbohydrates_unit'] = 'g';
      }
      if (grocery.protein?.isFinite == true) {
        body['nutriment_proteins_100g'] = grocery.protein!.toStringAsFixed(2);
        body['nutriment_proteins_unit'] = 'g';
      }
      if (grocery.fiber?.isFinite == true) {
        body['nutriment_fiber_100g'] = grocery.fiber!.toStringAsFixed(2);
        body['nutriment_fiber_unit'] = 'g';
      }

      final headers = {
        'User-Agent': '$appName/$trimmedAppVersion ($_contactUrl)',
      };

      final response = await client
          .post(_uploadUri, headers: headers, body: body)
          .timeout(requestTimeout);

      if (response.statusCode != 200) return false;

      final data = jsonDecode(response.body);
      if (data is! Map<String, dynamic>) return false;

      return data['status'] == 1;
    } catch (_) {
      return false;
    }
  }
}
