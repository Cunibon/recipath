import 'dart:convert';

import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:recipath/widgets/providers/secure_storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_provider_notifier.g.dart';

@riverpod
class AiProviderNotifier extends _$AiProviderNotifier {
  static const aiTokenKey = "aiTokenKey";

  @override
  Future<AiProviderData?> build() async {
    final storage = ref.watch(secureStorageProvider);

    final stringData = await storage.read(key: aiTokenKey);

    if (stringData == null) return null;

    return AiProviderData.fromJson(jsonDecode(stringData));
  }

  Future<void> set(AiProviderData? data) async {
    final storage = ref.read(secureStorageProvider);

    if (data == null) {
      await storage.delete(key: aiTokenKey);
    } else {
      await storage.write(key: aiTokenKey, value: jsonEncode(data.toJson()));
    }

    ref.invalidateSelf();
  }
}
