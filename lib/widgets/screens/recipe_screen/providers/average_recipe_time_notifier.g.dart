// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'average_recipe_time_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(averageRecipeTimeNotifier)
const averageRecipeTimeProvider = AverageRecipeTimeNotifierFamily._();

final class AverageRecipeTimeNotifierProvider
    extends
        $FunctionalProvider<AsyncValue<Duration?>, Duration?, Stream<Duration?>>
    with $FutureModifier<Duration?>, $StreamProvider<Duration?> {
  const AverageRecipeTimeNotifierProvider._({
    required AverageRecipeTimeNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'averageRecipeTimeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$averageRecipeTimeNotifierHash();

  @override
  String toString() {
    return r'averageRecipeTimeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Duration?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration?> create(Ref ref) {
    final argument = this.argument as String;
    return averageRecipeTimeNotifier(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AverageRecipeTimeNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$averageRecipeTimeNotifierHash() =>
    r'3d1bf69ebeb4c717395a62bb6ef240fa158dbc89';

final class AverageRecipeTimeNotifierFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Duration?>, String> {
  const AverageRecipeTimeNotifierFamily._()
    : super(
        retry: null,
        name: r'averageRecipeTimeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AverageRecipeTimeNotifierProvider call(String recipeId) =>
      AverageRecipeTimeNotifierProvider._(argument: recipeId, from: this);

  @override
  String toString() => r'averageRecipeTimeProvider';
}
