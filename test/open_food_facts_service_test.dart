import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/domain_service/open_food_facts_service/open_food_facts_service.dart';

void main() {
  const appVersion = '1.11.2';
  const account = OpenFoodFactsAccountData(
    username: 'testuser',
    password: 'testpass',
    appUuid: 'stable-installation-id',
  );

  OpenFoodFactsService service({
    required http.Client client,
    String serviceAppVersion = appVersion,
    Duration timeout = const Duration(seconds: 1),
  }) => OpenFoodFactsService(
    client: client,
    appVersion: serviceAppVersion,
    requestTimeout: timeout,
  );

  group('OpenFoodFactsService.uploadProduct', () {
    final sampleGrocery = GroceryData(
      id: 'item1234567890ab',
      name: 'Oat Milk',
      normalAmount: 1,
      unit: UnitEnum.l,
      conversionAmount: 1000,
      conversionUnit: UnitEnum.g,
      barcode: '1234567890123',
      kcal: 45,
      fat: 1.5,
      carbs: 6.5,
      protein: 1.0,
      fiber: 0.8,
    );

    Future<bool> upload({
      GroceryData? grocery,
      OpenFoodFactsAccountData uploadAccount = account,
      String serviceAppVersion = appVersion,
      required http.Client client,
      Duration timeout = const Duration(seconds: 1),
    }) => service(
      client: client,
      serviceAppVersion: serviceAppVersion,
      timeout: timeout,
    ).uploadProduct(account: uploadAccount, grocery: grocery ?? sampleGrocery);

    test('does not send a request when required data is missing', () async {
      final client = MockClient((_) async {
        fail('The request should not be sent');
      });

      expect(
        await upload(
          client: client,
          grocery: sampleGrocery.copyWith(barcode: '   '),
        ),
        isFalse,
      );
      expect(
        await upload(
          client: client,
          grocery: sampleGrocery.copyWith(name: '   '),
        ),
        isFalse,
      );
      expect(await upload(client: client, serviceAppVersion: ' '), isFalse);
    });

    test('sends the required product, account, and app metadata', () async {
      final client = MockClient((request) async {
        expect(
          request.url.toString(),
          'https://world.openfoodfacts.org/cgi/product_jqm2.pl',
        );
        expect(
          request.headers['user-agent'],
          'ReciPath/1.11.2 (https://github.com/Cunibon/recipath)',
        );
        expect(request.bodyFields, containsPair('code', '1234567890123'));
        expect(request.bodyFields, containsPair('product_name', 'Oat Milk'));
        expect(request.bodyFields, containsPair('quantity', '1.0 l'));
        expect(request.bodyFields, containsPair('user_id', 'testuser'));
        expect(request.bodyFields, containsPair('password', 'testpass'));
        expect(request.bodyFields, containsPair('app_name', 'ReciPath'));
        expect(request.bodyFields, containsPair('app_version', appVersion));
        expect(
          request.bodyFields,
          containsPair('app_uuid', 'stable-installation-id'),
        );
        expect(
          request.bodyFields,
          containsPair('nutriment_energy-kcal_100g', '45.00'),
        );
        expect(
          request.bodyFields,
          containsPair('nutriment_carbohydrates_100g', '6.50'),
        );

        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(await upload(client: client), isTrue);
    });

    test('does not send non-finite nutrient values', () async {
      final grocery = sampleGrocery.copyWith(
        kcal: double.nan,
        fat: double.infinity,
        carbs: double.negativeInfinity,
      );
      final client = MockClient((request) async {
        expect(
          request.bodyFields,
          isNot(contains('nutriment_energy-kcal_100g')),
        );
        expect(request.bodyFields, isNot(contains('nutriment_fat_100g')));
        expect(
          request.bodyFields,
          isNot(contains('nutriment_carbohydrates_100g')),
        );
        expect(
          request.bodyFields,
          containsPair('nutriment_proteins_100g', '1.00'),
        );

        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(await upload(client: client, grocery: grocery), isTrue);
    });

    test('accepts the documented fields saved response', () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode({'status': 1, 'status_verbose': 'fields saved'}),
          200,
        ),
      );

      expect(await upload(client: client), isTrue);
    });

    test('rejects unrecognized, malformed, and non-200 responses', () async {
      final responses = <http.Response>[
        http.Response(jsonEncode({'status': 0}), 200),
        http.Response(jsonEncode([]), 200),
        http.Response('not json', 200),
        http.Response('Server Error', 500),
      ];

      for (final response in responses) {
        final client = MockClient((_) async => response);
        expect(await upload(client: client), isFalse);
      }
    });

    test('returns false when the request throws or times out', () async {
      final throwingClient = MockClient((_) async {
        throw Exception('Network unreachable');
      });
      final slowClient = MockClient((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 100));
        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(await upload(client: throwingClient), isFalse);
      expect(
        await upload(
          client: slowClient,
          timeout: const Duration(milliseconds: 1),
        ),
        isFalse,
      );
    });
  });

  group('OpenFoodFactsService.validateCredentials', () {
    Future<OpenFoodFactsCredentialsStatus> validate({
      OpenFoodFactsAccountData validateAccount = account,
      String serviceAppVersion = appVersion,
      required http.Client client,
      Duration timeout = const Duration(seconds: 1),
    }) => service(
      client: client,
      serviceAppVersion: serviceAppVersion,
      timeout: timeout,
    ).validateCredentials(account: validateAccount);

    test('does not send a request when credentials are missing', () async {
      final client = MockClient((_) async {
        fail('The request should not be sent');
      });

      expect(
        await validate(
          client: client,
          validateAccount: account.copyWith(username: ''),
        ),
        OpenFoodFactsCredentialsStatus.invalid,
      );
      expect(
        await validate(
          client: client,
          validateAccount: account.copyWith(password: ''),
        ),
        OpenFoodFactsCredentialsStatus.invalid,
      );
    });

    test('sends credentials to the login endpoint', () async {
      final client = MockClient((request) async {
        expect(
          request.url.toString(),
          'https://world.openfoodfacts.org/cgi/auth.pl',
        );
        expect(
          request.headers['user-agent'],
          'ReciPath/1.11.2 (https://github.com/Cunibon/recipath)',
        );
        expect(request.bodyFields, containsPair('user_id', 'testuser'));
        expect(request.bodyFields, containsPair('password', 'testpass'));
        expect(request.bodyFields, containsPair('body', '1'));

        return http.Response(
          jsonEncode({'status': 1, 'status_verbose': 'user signed-in'}),
          200,
        );
      });

      expect(
        await validate(client: client),
        OpenFoodFactsCredentialsStatus.valid,
      );
    });

    test('identifies the app without a version when none is provided', () async {
      final client = MockClient((request) async {
        expect(
          request.headers['user-agent'],
          'ReciPath (https://github.com/Cunibon/recipath)',
        );

        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(
        await validate(client: client, serviceAppVersion: ''),
        OpenFoodFactsCredentialsStatus.valid,
      );
    });

    test('rejects credentials that are not signed in', () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode({'status': 0, 'status_verbose': 'user not signed-in'}),
          403,
        ),
      );

      expect(
        await validate(client: client),
        OpenFoodFactsCredentialsStatus.invalid,
      );
    });

    test('treats a status 0 response as invalid credentials', () async {
      final client = MockClient(
        (_) async => http.Response(jsonEncode({'status': 0}), 200),
      );

      expect(
        await validate(client: client),
        OpenFoodFactsCredentialsStatus.invalid,
      );
    });

    test('treats malformed and unexpected responses as failures', () async {
      final responses = <http.Response>[
        http.Response(jsonEncode([]), 200),
        http.Response('not json', 200),
        http.Response('Server Error', 500),
      ];

      for (final response in responses) {
        final client = MockClient((_) async => response);
        expect(
          await validate(client: client),
          OpenFoodFactsCredentialsStatus.failure,
        );
      }
    });

    test('returns failure when the request throws or times out', () async {
      final throwingClient = MockClient((_) async {
        throw Exception('Network unreachable');
      });
      final slowClient = MockClient((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 100));
        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(
        await validate(client: throwingClient),
        OpenFoodFactsCredentialsStatus.failure,
      );
      expect(
        await validate(
          client: slowClient,
          timeout: const Duration(milliseconds: 1),
        ),
        OpenFoodFactsCredentialsStatus.failure,
      );
    });
  });
}
