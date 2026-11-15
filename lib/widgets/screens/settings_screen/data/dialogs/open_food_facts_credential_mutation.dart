import 'package:bound_mutation/bound_mutation.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/domain_service/open_food_facts_service/open_food_facts_service.dart';
import 'package:recipath/domain_service/open_food_facts_service/open_food_facts_service_notifier.dart';

sealed class OpenFoodFactsCredentialsException implements Exception {
  const OpenFoodFactsCredentialsException();
}

final class OpenFoodFactsInvalidCredentialsException
    extends OpenFoodFactsCredentialsException {
  const OpenFoodFactsInvalidCredentialsException();
}

final class OpenFoodFactsCredentialsCheckException
    extends OpenFoodFactsCredentialsException {
  const OpenFoodFactsCredentialsCheckException();
}

final credentialsCheck =
    BoundMutation<OpenFoodFactsCredentialsStatus, OpenFoodFactsAccountData>((
      transaction,
      account,
    ) async {
      return (await transaction.get(
        openFoodFactsServiceProvider.future,
      )).validateCredentials(account: account);
    });
