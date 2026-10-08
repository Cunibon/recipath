import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/domain_service/open_food_facts_service/open_food_facts_service.dart';

void main() {
  group('OpenFoodFactsService.uploadProduct', () {
    const userId = 'testuser';
    const password = 'testpass';
    const appVersion = '1.11.2';
    const appUuid = 'stable-installation-id';

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
      String uploadUserId = userId,
      String uploadPassword = password,
      String uploadAppVersion = appVersion,
      String uploadAppUuid = appUuid,
      http.Client? client,
      Uri? uploadUri,
      Duration timeout = const Duration(seconds: 1),
    }) => OpenFoodFactsService.uploadProduct(
      grocery: grocery ?? sampleGrocery,
      userId: uploadUserId,
      password: uploadPassword,
      appVersion: uploadAppVersion,
      appUuid: uploadAppUuid,
      client: client,
      uploadUri: uploadUri,
      timeout: timeout,
    );

    test('does not send a request when required data is missing', () async {
      final client = MockClient((_) async {
        fail('The request should not be sent');
      });

      expect(
        await upload(
          grocery: sampleGrocery.copyWith(barcode: '   '),
          client: client,
        ),
        isFalse,
      );
      expect(
        await upload(
          grocery: sampleGrocery.copyWith(name: '   '),
          client: client,
        ),
        isFalse,
      );
      expect(await upload(uploadUserId: ' ', client: client), isFalse);
      expect(await upload(uploadPassword: ' ', client: client), isFalse);
      expect(await upload(uploadAppVersion: ' ', client: client), isFalse);
      expect(await upload(uploadAppUuid: ' ', client: client), isFalse);
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
        expect(request.bodyFields, containsPair('user_id', userId));
        expect(request.bodyFields, containsPair('password', password));
        expect(request.bodyFields, containsPair('app_name', 'ReciPath'));
        expect(request.bodyFields, containsPair('app_version', appVersion));
        expect(request.bodyFields, containsPair('app_uuid', appUuid));
        expect(
          request.bodyFields,
          containsPair('nutriment_energy-kcal_100g', '45.0'),
        );
        expect(
          request.bodyFields,
          containsPair('nutriment_carbohydrates_100g', '6.5'),
        );

        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(await upload(client: client), isTrue);
    });

    test('completes a real HTTP round trip', () async {
      final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      Map<String, String>? receivedFields;
      String? receivedUserAgent;

      server.listen((request) async {
        receivedUserAgent = request.headers.value(HttpHeaders.userAgentHeader);
        final encodedBody = await utf8.decoder.bind(request).join();
        receivedFields = Uri.splitQueryString(encodedBody);
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(jsonEncode({'status': 1}));
        await request.response.close();
      });

      try {
        final result = await upload(
          uploadUri: Uri.parse(
            'http://${server.address.host}:${server.port}/cgi/product_jqm2.pl',
          ),
        );

        expect(result, isTrue);
        expect(receivedFields, containsPair('code', '1234567890123'));
        expect(receivedFields, containsPair('app_uuid', appUuid));
        expect(
          receivedUserAgent,
          'ReciPath/1.11.2 (https://github.com/Cunibon/recipath)',
        );
      } finally {
        await server.close(force: true);
      }
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
          containsPair('nutriment_proteins_100g', '1.0'),
        );

        return http.Response(jsonEncode({'status': 1}), 200);
      });

      expect(await upload(grocery: grocery, client: client), isTrue);
    });

    test('accepts the documented fields saved response', () async {
      final client = MockClient(
        (_) async =>
            http.Response(jsonEncode({'status_verbose': 'fields saved'}), 200),
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
}
