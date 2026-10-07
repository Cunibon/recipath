// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryScreenNotifier)
final groceryScreenProvider = GroceryScreenNotifierProvider._();

final class GroceryScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<GroceryScreenState>,
          GroceryScreenState,
          FutureOr<GroceryScreenState>
        >
    with
        $FutureModifier<GroceryScreenState>,
        $FutureProvider<GroceryScreenState> {
  GroceryScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryScreenNotifierHash();

  @$internal
  @override
  $FutureProviderElement<GroceryScreenState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GroceryScreenState> create(Ref ref) {
    return groceryScreenNotifier(ref);
  }
}

String _$groceryScreenNotifierHash() =>
    r'ca031cd7f819c56c5425a3b76a76d542eddba3b9';
