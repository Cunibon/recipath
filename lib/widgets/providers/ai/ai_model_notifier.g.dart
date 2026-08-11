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
    extends $FunctionalProvider<AiBackend?, AiBackend?, AiBackend?>
    with $Provider<AiBackend?> {
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
  $ProviderElement<AiBackend?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AiBackend? create(Ref ref) {
    final argument = this.argument as AiProviderData?;
    return aiModelNotifier(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiBackend? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiBackend?>(value),
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

String _$aiModelNotifierHash() => r'e227bc1ed9be746e2b7fee428b591b8df58fae70';

final class AiModelNotifierFamily extends $Family
    with $FunctionalFamilyOverride<AiBackend?, AiProviderData?> {
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
