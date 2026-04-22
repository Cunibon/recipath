// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(aiModelNotifier)
final aiModelProvider = AiModelNotifierFamily._();

final class AiModelNotifierProvider
    extends
        $FunctionalProvider<
          BaseChatModel<ChatModelOptions>?,
          BaseChatModel<ChatModelOptions>?,
          BaseChatModel<ChatModelOptions>?
        >
    with $Provider<BaseChatModel<ChatModelOptions>?> {
  AiModelNotifierProvider._({
    required AiModelNotifierFamily super.from,
    required AiProviderData? super.argument,
  }) : super(
         retry: null,
         name: r'aiModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$aiModelNotifierHash();

  @override
  String toString() {
    return r'aiModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<BaseChatModel<ChatModelOptions>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseChatModel<ChatModelOptions>? create(Ref ref) {
    final argument = this.argument as AiProviderData?;
    return aiModelNotifier(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseChatModel<ChatModelOptions>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseChatModel<ChatModelOptions>?>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AiModelNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$aiModelNotifierHash() => r'6ae2f5ce5d579493cae65d79192becc1429d4ad6';

final class AiModelNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          BaseChatModel<ChatModelOptions>?,
          AiProviderData?
        > {
  AiModelNotifierFamily._()
    : super(
        retry: null,
        name: r'aiModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AiModelNotifierProvider call(AiProviderData? provider) =>
      AiModelNotifierProvider._(argument: provider, from: this);

  @override
  String toString() => r'aiModelProvider';
}
