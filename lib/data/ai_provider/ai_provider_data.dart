import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/ai_provider_enum.dart';

part 'ai_provider_data.freezed.dart';
part 'ai_provider_data.g.dart';

@freezed
abstract class AiProviderData with _$AiProviderData {
  const factory AiProviderData({
    required String token,
    required AiProviderEnum provider,
  }) = _AiProviderData;

  factory AiProviderData.fromJson(Map<String, Object?> json) =>
      _$AiProviderDataFromJson(json);
}
