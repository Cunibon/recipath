import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:recipath/widgets/providers/ai/ai_provider_notifier.dart';

class StubAiProvider extends AiProviderNotifier {
  StubAiProvider(this.data);

  final AiProviderData data;

  @override
  Future<AiProviderData?> build() async => data;
}
