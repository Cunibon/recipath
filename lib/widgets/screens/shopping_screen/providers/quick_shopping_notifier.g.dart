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
          AsyncValue<IMap<String, QuickShoppingData>>,
          IMap<String, QuickShoppingData>,
          Stream<IMap<String, QuickShoppingData>>
        >
    with
        $FutureModifier<IMap<String, QuickShoppingData>>,
        $StreamProvider<IMap<String, QuickShoppingData>> {
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
  $StreamProviderElement<IMap<String, QuickShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, QuickShoppingData>> create(Ref ref) {
    return quickShoppingNotifier(ref);
  }
}

String _$quickShoppingNotifierHash() =>
    r'7096e2062887770350fc540bcfbb1af3fa8f4b94';
