// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_account_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenFoodFactsAccountData _$OpenFoodFactsAccountDataFromJson(
  Map<String, dynamic> json,
) => _OpenFoodFactsAccountData(
  username: json['username'] as String,
  password: json['password'] as String,
  appUuid: json['appUuid'] as String,
);

Map<String, dynamic> _$OpenFoodFactsAccountDataToJson(
  _OpenFoodFactsAccountData instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
  'appUuid': instance.appUuid,
};
