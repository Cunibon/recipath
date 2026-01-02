// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseUser)
final supabaseUserProvider = SupabaseUserProvider._();

final class SupabaseUserProvider
    extends $FunctionalProvider<User?, User?, User?>
    with $Provider<User?> {
  SupabaseUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseUserHash();

  @$internal
  @override
  $ProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  User? create(Ref ref) {
    return supabaseUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(User? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<User?>(value),
    );
  }
}

String _$supabaseUserHash() => r'45e3f41b593c71c155d7da368adcb3aaca7a86b3';
