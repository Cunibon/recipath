// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_item_history_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeItemHistoryScreenNotifier)
final recipeItemHistoryScreenProvider =
    RecipeItemHistoryScreenNotifierFamily._();

final class RecipeItemHistoryScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<HistoryScreenData>,
          HistoryScreenData,
          FutureOr<HistoryScreenData>
        >
    with
        $FutureModifier<HistoryScreenData>,
        $FutureProvider<HistoryScreenData> {
  RecipeItemHistoryScreenNotifierProvider._({
    required RecipeItemHistoryScreenNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeItemHistoryScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeItemHistoryScreenNotifierHash();

  @override
  String toString() {
    return r'recipeItemHistoryScreenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HistoryScreenData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HistoryScreenData> create(Ref ref) {
    final argument = this.argument as String;
    return recipeItemHistoryScreenNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeItemHistoryScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeItemHistoryScreenNotifierHash() =>
    r'7e66710249230320b3b46ec65b6ed148bdc212d5';

final class RecipeItemHistoryScreenNotifierFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HistoryScreenData>, String> {
  RecipeItemHistoryScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'recipeItemHistoryScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeItemHistoryScreenNotifierProvider call(String id) =>
      RecipeItemHistoryScreenNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'recipeItemHistoryScreenProvider';
}
