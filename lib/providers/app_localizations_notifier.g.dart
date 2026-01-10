// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_localizations_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appLocalizationsNotifier)
final appLocalizationsProvider = AppLocalizationsNotifierProvider._();

final class AppLocalizationsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppLocalizations>,
          AppLocalizations,
          FutureOr<AppLocalizations>
        >
    with $FutureModifier<AppLocalizations>, $FutureProvider<AppLocalizations> {
  AppLocalizationsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocalizationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocalizationsNotifierHash();

  @$internal
  @override
  $FutureProviderElement<AppLocalizations> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppLocalizations> create(Ref ref) {
    return appLocalizationsNotifier(ref);
  }
}

String _$appLocalizationsNotifierHash() =>
    r'2f88f228084f30132f70b68b9cc5a02fe917262c';
