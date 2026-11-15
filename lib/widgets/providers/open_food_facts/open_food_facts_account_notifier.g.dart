// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_account_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OpenFoodFactsAccountNotifier)
final openFoodFactsAccountProvider = OpenFoodFactsAccountNotifierProvider._();

final class OpenFoodFactsAccountNotifierProvider
    extends
        $AsyncNotifierProvider<
          OpenFoodFactsAccountNotifier,
          OpenFoodFactsAccountData?
        > {
  OpenFoodFactsAccountNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openFoodFactsAccountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openFoodFactsAccountNotifierHash();

  @$internal
  @override
  OpenFoodFactsAccountNotifier create() => OpenFoodFactsAccountNotifier();
}

String _$openFoodFactsAccountNotifierHash() =>
    r'39bdf7cabb272fafc76ed1d725468f6208c242d4';

abstract class _$OpenFoodFactsAccountNotifier
    extends $AsyncNotifier<OpenFoodFactsAccountData?> {
  FutureOr<OpenFoodFactsAccountData?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<OpenFoodFactsAccountData?>,
              OpenFoodFactsAccountData?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<OpenFoodFactsAccountData?>,
                OpenFoodFactsAccountData?
              >,
              AsyncValue<OpenFoodFactsAccountData?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
