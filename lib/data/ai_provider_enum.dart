import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_anthropic/langchain_anthropic.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';
import 'package:langchain_openai/langchain_openai.dart';

@JsonEnum()
enum AiProviderEnum {
  @JsonValue("Google")
  google(
    displayName: 'Google Gemini',
    defaultModel: 'gemini-2.5-flash',
    tokenUrl: 'https://aistudio.google.com/app/apikey',
    handshakeOptions: ChatGoogleGenerativeAIOptions(maxOutputTokens: 1),
  ),

  @JsonValue("Anthropic")
  anthropic(
    displayName: 'Anthropic Claude',
    defaultModel: 'claude-sonnet-4-6',
    tokenUrl: 'https://console.anthropic.com/settings/keys',
    handshakeOptions: ChatAnthropicOptions(maxTokens: 1),
  ),

  @JsonValue("Mistral")
  mistral(
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small-latest',
    tokenUrl: 'https://console.mistral.ai/api-keys/',
    handshakeOptions: ChatMistralAIOptions(maxTokens: 1),
  ),

  @JsonValue("Moonshot")
  moonshot(
    displayName: 'Moonshot Kimi',
    defaultModel: 'kimi-k2.5',
    tokenUrl: 'https://platform.moonshot.ai/console/api-keys',
    handshakeOptions: ChatOpenAIOptions(maxTokens: 1),
  ),

  @JsonValue("DeepSeek")
  deepSeek(
    displayName: 'DeepSeek',
    defaultModel: 'deepseek-chat',
    tokenUrl: 'https://platform.deepseek.com/api_keys',
    handshakeOptions: ChatOpenAIOptions(maxTokens: 1),
    multimodal: false,
  ),

  @JsonValue("OpenAi")
  openAi(
    displayName: 'OpenAI',
    defaultModel: 'gpt-4.1-mini',
    tokenUrl: 'https://platform.openai.com/api-keys',
    handshakeOptions: ChatOpenAIOptions(maxTokens: 1),
  );

  final String displayName;
  final String defaultModel;
  final String tokenUrl;
  final ChatModelOptions handshakeOptions;
  final bool multimodal;

  const AiProviderEnum({
    required this.displayName,
    required this.defaultModel,
    required this.tokenUrl,
    required this.handshakeOptions,
    this.multimodal = true,
  });
}
