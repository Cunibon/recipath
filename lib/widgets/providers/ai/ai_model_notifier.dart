import 'package:recipath/data/ai/ai_backend.dart';
import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_model_notifier.g.dart';

@riverpod
AiBackend? aiModelNotifier(Ref ref, AiProviderData? provider) {
  if (provider == null) return null;

  final backend = AiBackend.create(provider.provider, provider.token);
  ref.onDispose(backend.dispose);

  return backend;
}
