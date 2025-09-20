// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocaleNotifier)
const localeProvider = LocaleNotifierProvider._();

final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale> {
  const LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeNotifierHash() => r'd5b0348ccb12ce2e94ec0789989ff620e2ce9394';

abstract class _$LocaleNotifier extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
