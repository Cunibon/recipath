import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_food_facts_account_data.freezed.dart';
part 'open_food_facts_account_data.g.dart';

@freezed
abstract class OpenFoodFactsAccountData with _$OpenFoodFactsAccountData {
  const factory OpenFoodFactsAccountData({
    required String username,
    required String password,
    required String appUuid,
  }) = _OpenFoodFactsAccountData;

  factory OpenFoodFactsAccountData.fromJson(Map<String, Object?> json) =>
      _$OpenFoodFactsAccountDataFromJson(json);
}
