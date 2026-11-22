import 'dart:convert';

import 'package:bound_mutation/bound_mutation.dart';
import 'package:http/http.dart' as http;
import 'package:recipath/data/backend_config/backend_config_data.dart';

sealed class BackendConfigCheckException implements Exception {
  const BackendConfigCheckException();
}

final class BackendConfigKeyRejectedException
    extends BackendConfigCheckException {
  const BackendConfigKeyRejectedException();
}

final class BackendConfigUnreachableException
    extends BackendConfigCheckException {
  const BackendConfigUnreachableException();
}

final backendConfigCheck = BoundMutation<void, BackendConfigData>((
  transaction,
  config,
) async {
  final http.Response response;
  try {
    response = await http
        .get(
          Uri.parse('${config.url}/auth/v1/settings'),
          headers: {'apikey': config.key},
        )
        .timeout(const Duration(seconds: 10));
  } catch (_) {
    throw const BackendConfigUnreachableException();
  }

  if (response.statusCode == 401 || response.statusCode == 403) {
    throw const BackendConfigKeyRejectedException();
  }

  if (response.statusCode != 200 || !_isJsonObject(response.body)) {
    throw const BackendConfigUnreachableException();
  }
});

bool _isJsonObject(String body) {
  try {
    return jsonDecode(body) is Map<String, dynamic>;
  } catch (_) {
    return false;
  }
}
