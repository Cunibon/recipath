// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compact_recipe_item_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(compactRecipeItemNotifier)
const compactRecipeItemProvider = CompactRecipeItemNotifierFamily._();

final class CompactRecipeItemNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<CompactRecipeItemState>,
          CompactRecipeItemState,
          FutureOr<CompactRecipeItemState>
        >
    with
        $FutureModifier<CompactRecipeItemState>,
        $FutureProvider<CompactRecipeItemState> {
  const CompactRecipeItemNotifierProvider._({
    required CompactRecipeItemNotifierFamily super.from,
    required RecipeData super.argument,
  }) : super(
         retry: null,
         name: r'compactRecipeItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$compactRecipeItemNotifierHash();

  @override
  String toString() {
    return r'compactRecipeItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CompactRecipeItemState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CompactRecipeItemState> create(Ref ref) {
    final argument = this.argument as RecipeData;
    return compactRecipeItemNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CompactRecipeItemNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$compactRecipeItemNotifierHash() =>
    r'434aaf683bf015668277aa548e373f2ed86e0123';

final class CompactRecipeItemNotifierFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CompactRecipeItemState>,
          RecipeData
        > {
  const CompactRecipeItemNotifierFamily._()
    : super(
        retry: null,
        name: r'compactRecipeItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompactRecipeItemNotifierProvider call(RecipeData recipe) =>
      CompactRecipeItemNotifierProvider._(argument: recipe, from: this);

  @override
  String toString() => r'compactRecipeItemProvider';
}
