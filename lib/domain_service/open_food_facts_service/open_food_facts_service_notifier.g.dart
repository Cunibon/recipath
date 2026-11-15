// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(openFoodFactsService)
final openFoodFactsServiceProvider = OpenFoodFactsServiceProvider._();

final class OpenFoodFactsServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<OpenFoodFactsService>,
          OpenFoodFactsService,
          FutureOr<OpenFoodFactsService>
        >
    with
        $FutureModifier<OpenFoodFactsService>,
        $FutureProvider<OpenFoodFactsService> {
  OpenFoodFactsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openFoodFactsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openFoodFactsServiceHash();

  @$internal
  @override
  $FutureProviderElement<OpenFoodFactsService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<OpenFoodFactsService> create(Ref ref) {
    return openFoodFactsService(ref);
  }
}

String _$openFoodFactsServiceHash() =>
    r'78a939a1281871adcf7416f705e00c8727e80b98';
