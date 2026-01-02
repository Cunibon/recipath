// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_you_scheme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(materialYouSchemeNotifier)
final materialYouSchemeProvider = MaterialYouSchemeNotifierProvider._();

final class MaterialYouSchemeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ColorScheme?>,
          ColorScheme?,
          FutureOr<ColorScheme?>
        >
    with $FutureModifier<ColorScheme?>, $FutureProvider<ColorScheme?> {
  MaterialYouSchemeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialYouSchemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialYouSchemeNotifierHash();

  @$internal
  @override
  $FutureProviderElement<ColorScheme?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ColorScheme?> create(Ref ref) {
    return materialYouSchemeNotifier(ref);
  }
}

String _$materialYouSchemeNotifierHash() =>
    r'fc8d91841861ceec2c7cfdaf6b7aa40d1c1fe9b0';
