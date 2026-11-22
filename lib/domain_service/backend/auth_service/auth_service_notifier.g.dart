// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authServiceNotifier)
final authServiceProvider = AuthServiceNotifierProvider._();

final class AuthServiceNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthService>,
          AuthService,
          FutureOr<AuthService>
        >
    with $FutureModifier<AuthService>, $FutureProvider<AuthService> {
  AuthServiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceNotifierHash();

  @$internal
  @override
  $FutureProviderElement<AuthService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthService> create(Ref ref) {
    return authServiceNotifier(ref);
  }
}

String _$authServiceNotifierHash() =>
    r'950869724d13fa7f0e7a232972d31e86ea4c31a0';
