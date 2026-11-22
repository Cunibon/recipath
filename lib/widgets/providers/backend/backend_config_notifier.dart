import 'dart:convert';

import 'package:recipath/application_constants.dart';
import 'package:recipath/data/backend_config/backend_config_data.dart';
import 'package:recipath/widgets/providers/secure_storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backend_config_notifier.g.dart';

@Riverpod(keepAlive: true)
class BackendConfigNotifier extends _$BackendConfigNotifier {
  static const backendConfigKey = "backendConfigKey";

  @override
  Future<BackendConfigData?> build() async {
    final storage = ref.watch(secureStorageProvider);

    final stringData = await storage.read(key: backendConfigKey);

    if (stringData != null) {
      try {
        final json = jsonDecode(stringData) as Map<String, dynamic>;

        return BackendConfigData.fromJson(json);
      } catch (_) {}
    }

    return supabaseUrl.isNotEmpty && supabaseKey.isNotEmpty
        ? const BackendConfigData(url: supabaseUrl, key: supabaseKey)
        : null;
  }

  Future<void> set(BackendConfigData? data) async {
    final storage = ref.read(secureStorageProvider);

    if (data == null) {
      await storage.delete(key: backendConfigKey);
    } else {
      await storage.write(
        key: backendConfigKey,
        value: jsonEncode(data.toJson()),
      );
    }
  }
}
