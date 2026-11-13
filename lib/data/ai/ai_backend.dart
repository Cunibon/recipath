import 'package:genkit/genkit.dart';
import 'package:genkit/lite.dart' as lite;
import 'package:genkit_anthropic/genkit_anthropic.dart' as anthropic_plugin;
import 'package:genkit_google_genai/genkit_google_genai.dart' as google_plugin;
import 'package:genkit_openai/genkit_openai.dart' as openai_plugin;
import 'package:http/http.dart' as http;
import 'package:recipath/data/ai/chat_request_client.dart';
import 'package:recipath/data/ai_provider_enum.dart';
import 'package:schemantic/schemantic.dart';

class AiBackend {
  AiBackend({required this.provider, required this.model, this.ownedClient});

  final AiProviderEnum provider;
  final Model model;
  final http.Client? ownedClient;

  void dispose() => ownedClient?.close();

  static AiBackend create(AiProviderEnum provider, String token) {
    final modelName = provider.defaultModel;

    switch (provider) {
      case AiProviderEnum.google:
        final plugin = google_plugin.googleAI(apiKey: token);
        return AiBackend(provider: provider, model: plugin.model(modelName));

      case AiProviderEnum.anthropic:
        final plugin = anthropic_plugin.anthropic(apiKey: token);
        return AiBackend(provider: provider, model: plugin.model(modelName));

      case AiProviderEnum.mistral:
      case AiProviderEnum.moonshot:
      case AiProviderEnum.openAi:
        final owned = ChatRequestClient(
          disableThinking: provider.shouldDisableThinking(modelName),
        );
        final plugin = openai_plugin.openAI(
          name: provider.namespace,
          apiKey: token,
          baseUrl: provider.baseUrl,
          httpClient: owned,
        );
        return AiBackend(
          provider: provider,
          model: plugin.model(modelName),
          ownedClient: owned,
        );
    }
  }

  Future<GenerateResult<Map<String, dynamic>>> generate({
    required String systemPrompt,
    required List<Part> userContent,
    required SchemanticType<Map<String, dynamic>> outputSchema,
  }) => _throwOnFailure(
    lite.generate(
      model: model,
      config: provider.requestConfig,
      system: systemPrompt,
      messages: [Message(role: Role.user, content: userContent)],
      outputSchema: outputSchema,
    ),
  );

  Future<GenerateResult> handshake() => _throwOnFailure(
    lite.generate(
      model: model,
      config: provider.handshakeConfig,
      prompt: 'ping',
    ),
  );

  static Future<GenerateResult<T>> _throwOnFailure<T>(
    Future<GenerateResult<T>> pending,
  ) async {
    final result = await pending;
    if (result.finishReason == FinishReason.failed) {
      throw result.cause ??
          GenkitException(result.finishMessage ?? 'Generation failed');
    }
    return result;
  }
}
