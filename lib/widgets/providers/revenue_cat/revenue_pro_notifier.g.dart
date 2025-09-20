// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_pro_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(revenueProNotifier)
const revenueProProvider = RevenueProNotifierProvider._();

final class RevenueProNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const RevenueProNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revenueProProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revenueProNotifierHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return revenueProNotifier(ref);
  }
}

String _$revenueProNotifierHash() =>
    r'ea327792d567d7afb78e325645dc6c81aebee2df';
