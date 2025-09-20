// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'double_number_format_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(doubleNumberFormatNotifier)
const doubleNumberFormatProvider = DoubleNumberFormatNotifierProvider._();

final class DoubleNumberFormatNotifierProvider
    extends $FunctionalProvider<NumberFormat, NumberFormat, NumberFormat>
    with $Provider<NumberFormat> {
  const DoubleNumberFormatNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doubleNumberFormatProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doubleNumberFormatNotifierHash();

  @$internal
  @override
  $ProviderElement<NumberFormat> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NumberFormat create(Ref ref) {
    return doubleNumberFormatNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NumberFormat value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NumberFormat>(value),
    );
  }
}

String _$doubleNumberFormatNotifierHash() =>
    r'ef028de6b31f3bc2566b4f21d930761d90431b38';
