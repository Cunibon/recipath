// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_you_scheme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(materialYouSchemeNotifier)
const materialYouSchemeProvider = MaterialYouSchemeNotifierProvider._();

final class MaterialYouSchemeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ColorScheme?>,
          ColorScheme?,
          FutureOr<ColorScheme?>
        >
    with $FutureModifier<ColorScheme?>, $FutureProvider<ColorScheme?> {
  const MaterialYouSchemeNotifierProvider._()
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
    r'3c083aad2eb93e0371c761f6f33163bea2f0f63c';
