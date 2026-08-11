import 'package:genkit/genkit.dart';
import 'package:genkit/lite.dart' as lite;
import 'package:genkit/plugin.dart' show GenkitPlugin;
import 'package:genkit_anthropic/genkit_anthropic.dart' as anthropic_plugin;
import 'package:genkit_google_genai/common.dart';
import 'package:genkit_openai/genkit_openai.dart' as openai_plugin;
import 'package:http/http.dart' as http;
import 'package:recipath/data/ai_provider_enum.dart';
import 'package:recipath/data/thinking_disabled_client.dart';
import 'package:schemantic/schemantic.dart';

class AiBackend {
  AiBackend({
    required this.provider,
    required this.plugin,
    required this.model,
    this.ownedClient,
  });

  final AiProviderEnum provider;
  final GenkitPlugin plugin;
  final Model model;
  final http.Client? ownedClient;

  void dispose() => ownedClient?.close();

  static AiBackend create(
    AiProviderEnum provider,
    String token, {
    String? model,
    String? baseUrlOverride,
    http.Client? httpClient,
  }) {
    final modelName = model ?? provider.defaultModel;

    switch (provider) {
      case AiProviderEnum.google:
        final plugin = GoogleGenAiPlugin(
          apiKey: token,
          baseUrl:
              baseUrlOverride ?? 'https://generativelanguage.googleapis.com/',
          httpClient: httpClient,
        );
        return AiBackend(
          provider: provider,
          plugin: plugin,
          model: plugin.model(modelName),
        );

      case AiProviderEnum.anthropic:
        final plugin = anthropic_plugin.anthropic(
          apiKey: token,
          baseUrl: baseUrlOverride ?? 'https://api.anthropic.com',
        );
        return AiBackend(
          provider: provider,
          plugin: plugin,
          model: plugin.model(modelName),
        );

      case AiProviderEnum.mistral:
      case AiProviderEnum.moonshot:
      case AiProviderEnum.openAi:
        final owned =
            httpClient == null && provider.shouldDisableThinking(modelName)
            ? ThinkingDisabledClient()
            : null;
        final plugin = openai_plugin.openAI(
          name: provider.namespace,
          apiKey: token,
          baseUrl: baseUrlOverride ?? provider.baseUrl,
          httpClient: httpClient ?? owned,
        );
        return AiBackend(
          provider: provider,
          plugin: plugin,
          model: plugin.model(modelName),
          ownedClient: owned,
        );
    }
  }

  Future<GenerateResponseHelper> generate({
    required String systemPrompt,
    required List<Part> userContent,
    required SchemanticType<Map<String, dynamic>> outputSchema,
  }) => lite.generate(
    model: model,
    config: provider.requestConfig,
    system: systemPrompt,
    messages: [Message(role: Role.user, content: userContent)],
    outputSchema: outputSchema,
  );

  Future<GenerateResponseHelper> handshake() => lite.generate(
    model: model,
    config: provider.handshakeConfig,
    prompt: 'ping',
  );
}

class GoogleGenAiPlugin extends CommonGoogleGenPlugin {
  GoogleGenAiPlugin({
    required this.apiKey,
    this.baseUrl = 'https://generativelanguage.googleapis.com/',
    this.httpClient,
  });

  final String apiKey;
  final String baseUrl;
  final http.Client? httpClient;

  @override
  String get name => 'googleai';

  @override
  Future<GenerativeLanguageBaseClient> getApiClient([
    String? requestApiKey,
  ]) async {
    final inner = httpClient;
    return GenerativeLanguageBaseClient(
      baseUrl: baseUrl,
      client: inner == null
          ? httpClientFromApiKey(requestApiKey ?? apiKey)
          : CustomClient(
              defaultHeaders: {'x-goog-api-key': requestApiKey ?? apiKey},
              inner: inner,
            ),
    );
  }

  @override
  Embedder createEmbedder(String embedderName) =>
      throw UnimplementedError('ReciPath does not use embedders');
}
