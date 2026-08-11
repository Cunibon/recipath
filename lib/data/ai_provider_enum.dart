import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum AiProviderEnum {
  @JsonValue("Google")
  google(
    displayName: 'Google Gemini',
    defaultModel: 'gemini-3.5-flash-lite',
    tokenUrl: 'https://aistudio.google.com/app/apikey',
    namespace: 'googleai',
    handshakeConfig: {
      'maxOutputTokens': 512,
      'thinkingConfig': {'thinkingLevel': 'minimal'},
    },
    requestConfig: {
      'maxOutputTokens': 65536,
      'thinkingConfig': {'thinkingLevel': 'minimal'},
    },
  ),

  @JsonValue("Anthropic")
  anthropic(
    displayName: 'Anthropic Claude',
    defaultModel: 'claude-sonnet-4-6',
    tokenUrl: 'https://platform.claude.com/settings/keys',
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
    tokenUrl: 'https://platform.kimi.ai/console/api-keys',
    namespace: 'moonshot',
    baseUrl: 'https://api.moonshot.ai/v1',
    thinkingDisableModelPrefix: 'kimi-k2.6',
    handshakeConfig: {'maxTokens': 1},
    requestConfig: {'maxTokens': 16384},
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
    this.thinkingDisableModelPrefix,
    // ignore: unused_element_parameter
    this.multimodal = true,
  });

  final String displayName;
  final String defaultModel;
  final String tokenUrl;
  final String namespace;
  final String? baseUrl;
  final String? thinkingDisableModelPrefix;
  final Map<String, dynamic> handshakeConfig;
  final Map<String, dynamic> requestConfig;
  final bool multimodal;

  bool shouldDisableThinking(String model) =>
      thinkingDisableModelPrefix != null &&
      model.startsWith(thinkingDisableModelPrefix!);
}
