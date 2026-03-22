// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AiProviderNotifier)
final aiProviderProvider = AiProviderNotifierProvider._();

final class AiProviderNotifierProvider
    extends $AsyncNotifierProvider<AiProviderNotifier, AiProviderData?> {
  AiProviderNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiProviderNotifierHash();

  @$internal
  @override
  AiProviderNotifier create() => AiProviderNotifier();
}

String _$aiProviderNotifierHash() =>
    r'df77494a7d2fe86d8edc5eb33b139cc8c83735cd';

abstract class _$AiProviderNotifier extends $AsyncNotifier<AiProviderData?> {
  FutureOr<AiProviderData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AiProviderData?>, AiProviderData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AiProviderData?>, AiProviderData?>,
              AsyncValue<AiProviderData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
