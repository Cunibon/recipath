import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/widgets/providers/open_food_facts/open_food_facts_account_notifier.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  test('OpenFoodFactsAccountData preserves its stable app UUID', () {
    const account = OpenFoodFactsAccountData(
      username: 'test-user',
      password: 'test-password',
      appUuid: 'stable-installation-id',
    );

    final restored = OpenFoodFactsAccountData.fromJson(account.toJson());

    expect(restored.username, account.username);
    expect(restored.password, account.password);
    expect(restored.appUuid, account.appUuid);
  });

  test('legacy stored accounts receive and persist a UUID', () async {
    FlutterSecureStorage.setMockInitialValues({
      OpenFoodFactsAccountNotifier.offAccountKey: jsonEncode({
        'username': 'legacy-user',
        'password': 'legacy-password',
      }),
    });
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final account = await container.read(openFoodFactsAccountProvider.future);
    final storedJson = await FlutterSecureStorage().read(
      key: OpenFoodFactsAccountNotifier.offAccountKey,
    );
    final storedAccount = OpenFoodFactsAccountData.fromJson(
      jsonDecode(storedJson!) as Map<String, dynamic>,
    );

    expect(account, isNotNull);
    expect(
      account!.appUuid,
      matches(
        RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        ),
      ),
    );
    expect(storedAccount.appUuid, account.appUuid);
  });
}
