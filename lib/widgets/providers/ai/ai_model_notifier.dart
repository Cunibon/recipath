import 'package:langchain/langchain.dart';
import 'package:langchain_anthropic/langchain_anthropic.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:recipath/data/ai_provider/ai_provider_data.dart';
import 'package:recipath/data/ai_provider_enum.dart';
import 'package:recipath/data/thinking_disabled_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_model_notifier.g.dart';

@riverpod
BaseChatModel? aiModelNotifier(Ref ref, AiProviderData? provider) {
  if (provider == null) return null;

  final token = provider.token;
  final enumValue = provider.provider;

  switch (enumValue) {
    case AiProviderEnum.google:
      return ChatGoogleGenerativeAI(
        apiKey: token,
        defaultOptions: ChatGoogleGenerativeAIOptions(
          model: enumValue.defaultModel,
        ),
      );

    case AiProviderEnum.anthropic:
      return ChatAnthropic(
        apiKey: token,
        defaultOptions: ChatAnthropicOptions(
          model: enumValue.defaultModel,
          maxTokens: 16384,
        ),
      );

    case AiProviderEnum.mistral:
      return ChatMistralAI(
        apiKey: token,
        defaultOptions: ChatMistralAIOptions(model: enumValue.defaultModel),
      );

    // case AiProviderEnum.deepSeek:
    //   return ChatOpenAI(
    //     apiKey: token,
    //     baseUrl: 'https://api.deepseek.com/beta',
    //     defaultOptions: ChatOpenAIOptions(model: enumValue.defaultModel),
    //     client: ThinkingDisabledClient(),
    //   );

    case AiProviderEnum.moonshot:
      return ChatOpenAI(
        apiKey: token,
        baseUrl: 'https://api.moonshot.ai/v1',
        defaultOptions: ChatOpenAIOptions(model: enumValue.defaultModel),
        client: ThinkingDisabledClient(),
      );

    case AiProviderEnum.openAi:
      return ChatOpenAI(
        apiKey: token,
        defaultOptions: ChatOpenAIOptions(model: enumValue.defaultModel),
      );
  }
}
