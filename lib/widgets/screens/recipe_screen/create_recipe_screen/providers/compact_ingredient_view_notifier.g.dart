// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compact_ingredient_view_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(compactIngredientViewNotifier)
final compactIngredientViewProvider = CompactIngredientViewNotifierProvider._();

final class CompactIngredientViewNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<CompactIngredientViewState>,
          CompactIngredientViewState,
          FutureOr<CompactIngredientViewState>
        >
    with
        $FutureModifier<CompactIngredientViewState>,
        $FutureProvider<CompactIngredientViewState> {
  CompactIngredientViewNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'compactIngredientViewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$compactIngredientViewNotifierHash();

  @$internal
  @override
  $FutureProviderElement<CompactIngredientViewState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CompactIngredientViewState> create(Ref ref) {
    return compactIngredientViewNotifier(ref);
  }
}

String _$compactIngredientViewNotifierHash() =>
    r'68b8ac2f768bff2d4ff7641d9bae9e59ae51bf93';
