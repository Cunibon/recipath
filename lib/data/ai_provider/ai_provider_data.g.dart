// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiProviderData _$AiProviderDataFromJson(Map<String, dynamic> json) =>
    _AiProviderData(
      token: json['token'] as String,
      provider: $enumDecode(_$AiProviderEnumEnumMap, json['provider']),
    );

Map<String, dynamic> _$AiProviderDataToJson(_AiProviderData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'provider': _$AiProviderEnumEnumMap[instance.provider]!,
    };

const _$AiProviderEnumEnumMap = {
  AiProviderEnum.google: 'Google',
  AiProviderEnum.anthropic: 'Anthropic',
  AiProviderEnum.mistral: 'Mistral',
  AiProviderEnum.moonshot: 'Moonshot',
  AiProviderEnum.deepSeek: 'DeepSeek',
  AiProviderEnum.openAi: 'OpenAi',
};
