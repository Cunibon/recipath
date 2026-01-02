// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_auth_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseAuthState)
final supabaseAuthStateProvider = SupabaseAuthStateProvider._();

final class SupabaseAuthStateProvider
    extends
        $FunctionalProvider<AsyncValue<AuthState>, AuthState, Stream<AuthState>>
    with $FutureModifier<AuthState>, $StreamProvider<AuthState> {
  SupabaseAuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseAuthStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseAuthStateHash();

  @$internal
  @override
  $StreamProviderElement<AuthState> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<AuthState> create(Ref ref) {
    return supabaseAuthState(ref);
  }
}

String _$supabaseAuthStateHash() => r'28116a090d3eaab164f2b35a33a0b42cf3744001';
