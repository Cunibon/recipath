import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipath/data/grocery_data/grocery_data.dart';

class OpenFoodFactsService {
  static final Uri _uploadUri = Uri.parse(
    'https://world.openfoodfacts.org/cgi/product_jqm2.pl',
  );
  static const Duration _requestTimeout = Duration(seconds: 15);
  static const String _appName = 'ReciPath';
  static const String _contactUrl = 'https://github.com/Cunibon/recipath';

  /// Uploads or updates grocery details on Open Food Facts.
  static Future<bool> uploadProduct({
    required GroceryData grocery,
    required String userId,
    required String password,
    required String appVersion,
    required String appUuid,
    http.Client? client,
    Uri? uploadUri,
    Duration timeout = _requestTimeout,
  }) async {
    final barcode = grocery.barcode?.trim();
    final productName = grocery.name.trim();
    final trimmedUserId = userId.trim();
    final trimmedPassword = password.trim();
    final trimmedAppVersion = appVersion.trim();
    final trimmedAppUuid = appUuid.trim();

    if (barcode == null ||
        barcode.isEmpty ||
        productName.isEmpty ||
        trimmedUserId.isEmpty ||
        trimmedPassword.isEmpty ||
        trimmedAppVersion.isEmpty ||
        trimmedAppUuid.isEmpty) {
      return false;
    }

    try {
      final body = <String, String>{
        'code': barcode,
        'product_name': productName,
        'quantity': '${grocery.normalAmount} ${grocery.unit.name}',
        'user_id': trimmedUserId,
        'password': trimmedPassword,
        'app_name': _appName,
        'app_version': trimmedAppVersion,
        'app_uuid': trimmedAppUuid,
      };

      if (grocery.kcal?.isFinite == true) {
        body['nutriment_energy-kcal_100g'] = grocery.kcal.toString();
        body['nutriment_energy-kcal_unit'] = 'kcal';
      }
      if (grocery.fat?.isFinite == true) {
        body['nutriment_fat_100g'] = grocery.fat.toString();
        body['nutriment_fat_unit'] = 'g';
      }
      if (grocery.carbs?.isFinite == true) {
        body['nutriment_carbohydrates_100g'] = grocery.carbs.toString();
        body['nutriment_carbohydrates_unit'] = 'g';
      }
      if (grocery.protein?.isFinite == true) {
        body['nutriment_proteins_100g'] = grocery.protein.toString();
        body['nutriment_proteins_unit'] = 'g';
      }
      if (grocery.fiber?.isFinite == true) {
        body['nutriment_fiber_100g'] = grocery.fiber.toString();
        body['nutriment_fiber_unit'] = 'g';
      }

      final headers = {
        'User-Agent': '$_appName/$trimmedAppVersion ($_contactUrl)',
      };

      final response = client != null
          ? await client
                .post(uploadUri ?? _uploadUri, headers: headers, body: body)
                .timeout(timeout)
          : await http
                .post(uploadUri ?? _uploadUri, headers: headers, body: body)
                .timeout(timeout);

      if (response.statusCode != 200) return false;

      final data = jsonDecode(response.body);
      if (data is! Map<String, dynamic>) return false;

      return data['status'] == 1 || data['status_verbose'] == 'fields saved';
    } catch (_) {
      return false;
    }
  }
}
