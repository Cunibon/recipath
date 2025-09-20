// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_data_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeDataNotifier)
const themeDataProvider = ThemeDataNotifierProvider._();

final class ThemeDataNotifierProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  const ThemeDataNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeDataNotifierHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return themeDataNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$themeDataNotifierHash() => r'a58cf1bc2fdc670638c2866c8f4fc9f9a0074a74';
