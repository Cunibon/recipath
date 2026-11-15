import 'dart:convert';

import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/widgets/providers/secure_storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_food_facts_account_notifier.g.dart';

@riverpod
class OpenFoodFactsAccountNotifier extends _$OpenFoodFactsAccountNotifier {
  static const offAccountKey = "openFoodFactsAccountKey";

  @override
  Future<OpenFoodFactsAccountData?> build() async {
    final storage = ref.watch(secureStorageProvider);

    final stringData = await storage.read(key: offAccountKey);

    if (stringData == null) return null;

    try {
      final json = jsonDecode(stringData) as Map<String, dynamic>;

      return OpenFoodFactsAccountData.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> set(OpenFoodFactsAccountData? data) async {
    final storage = ref.read(secureStorageProvider);

    if (data == null) {
      await storage.delete(key: offAccountKey);
    } else {
      await storage.write(key: offAccountKey, value: jsonEncode(data.toJson()));
    }

    ref.invalidateSelf();
  }
}
