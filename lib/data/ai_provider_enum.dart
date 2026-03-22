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
    defaultModel: 'gemini-3.1-pro',
    tokenUrl: 'https://aistudio.google.com/app/apikey',
    handshakeOptions: ChatGoogleGenerativeAIOptions(maxOutputTokens: 1),
  ),

  @JsonValue("Anthropic")
  anthropic(
    displayName: 'Anthropic Claude',
    defaultModel: 'claude-opus-4.6',
    tokenUrl: 'https://console.anthropic.com/settings/keys',
    handshakeOptions: ChatAnthropicOptions(maxTokens: 1),
  ),

  @JsonValue("Mistral")
  mistral(
    displayName: 'Mistral AI',
    defaultModel: 'mistral-small-4',
    tokenUrl: 'https://console.mistral.ai/api-keys/',
    handshakeOptions: ChatMistralAIOptions(maxTokens: 1),
  ),

  @JsonValue("OpencodeGo")
  opencodeGo(
    displayName: 'OpencodeGo',
    defaultModel: 'kimi-k2.5',
    tokenUrl: 'https://opencode.ai/auth',
    handshakeOptions: ChatOpenAIOptions(maxTokens: 1),
  ),

  @JsonValue("OpenAi")
  openAi(
    displayName: 'OpenAI',
    defaultModel: 'gpt-4.5-preview',
    tokenUrl: 'https://platform.openai.com/api-keys',
    handshakeOptions: ChatOpenAIOptions(maxTokens: 1),
  );

  final String displayName;
  final String defaultModel;
  final String tokenUrl;
  final ChatModelOptions handshakeOptions;

  const AiProviderEnum({
    required this.displayName,
    required this.defaultModel,
    required this.tokenUrl,
    required this.handshakeOptions,
  });
}
