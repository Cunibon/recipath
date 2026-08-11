import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum AiProviderEnum {
  @JsonValue("Google")
  google(
    displayName: 'Google Gemini',
    defaultModel: 'gemini-2.5-flash',
    tokenUrl: 'https://aistudio.google.com/app/apikey',
    namespace: 'googleai',
    handshakeConfig: {
      'maxOutputTokens': 1,
      'thinkingConfig': {'thinkingBudget': 0},
    },
    requestConfig: {'temperature': 0, 'maxOutputTokens': 65536},
  ),

  @JsonValue("Anthropic")
  anthropic(
    displayName: 'Anthropic Claude',
    defaultModel: 'claude-sonnet-4-6',
    tokenUrl: 'https://console.anthropic.com/settings/keys',
    namespace: 'anthropic',
    handshakeConfig: {'maxTokens': 1},
    requestConfig: {'maxTokens': 16384, 'temperature': 0},
  ),

  @JsonValue("Mistral")
  mistral(
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small-latest',
    tokenUrl: 'https://console.mistral.ai/api-keys/',
    namespace: 'mistral',
    baseUrl: 'https://api.mistral.ai/v1',
    handshakeConfig: {},
    requestConfig: {'temperature': 0},
  ),

  @JsonValue("Moonshot")
  moonshot(
    displayName: 'Moonshot Kimi',
    defaultModel: 'kimi-k2.6',
    tokenUrl: 'https://platform.moonshot.ai/console/api-keys',
    namespace: 'moonshot',
    baseUrl: 'https://api.moonshot.ai/v1',
    disableThinking: true,
    handshakeConfig: {'maxTokens': 1},
    requestConfig: {'maxTokens': 16384, 'temperature': 0},
  ),

  @JsonValue("OpenAi")
  openAi(
    displayName: 'OpenAI',
    defaultModel: 'gpt-5.4-mini',
    tokenUrl: 'https://platform.openai.com/api-keys',
    namespace: 'openai',
    baseUrl: 'https://api.openai.com/v1',
    handshakeConfig: {'maxTokens': 1},
    requestConfig: {'maxTokens': 16384},
  );

  const AiProviderEnum({
    required this.displayName,
    required this.defaultModel,
    required this.tokenUrl,
    required this.namespace,
    required this.handshakeConfig,
    required this.requestConfig,
    this.baseUrl,
    this.disableThinking = false,
    // ignore: unused_element_parameter
    this.multimodal = true,
  });

  final String displayName;
  final String defaultModel;
  final String tokenUrl;
  final String namespace;
  final String? baseUrl;
  final bool disableThinking;
  final Map<String, dynamic> handshakeConfig;
  final Map<String, dynamic> requestConfig;
  final bool multimodal;
}
