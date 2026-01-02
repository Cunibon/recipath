// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_pro_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(revenueProNotifier)
final revenueProProvider = RevenueProNotifierProvider._();

final class RevenueProNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  RevenueProNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revenueProProvider',
        isAutoDispose: false,
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
    r'11541c4168eb3b448435e778f7c2e8c29382f71c';
