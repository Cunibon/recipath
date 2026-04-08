// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_shopping_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quickShoppingNotifier)
final quickShoppingProvider = QuickShoppingNotifierProvider._();

final class QuickShoppingNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, QuickShoppingData>>,
          Map<String, QuickShoppingData>,
          Stream<Map<String, QuickShoppingData>>
        >
    with
        $FutureModifier<Map<String, QuickShoppingData>>,
        $StreamProvider<Map<String, QuickShoppingData>> {
  QuickShoppingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quickShoppingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quickShoppingNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, QuickShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, QuickShoppingData>> create(Ref ref) {
    return quickShoppingNotifier(ref);
  }
}

String _$quickShoppingNotifierHash() =>
    r'268e8a67f5f4185e6aa449b88661a8e8f0bb5b9e';
