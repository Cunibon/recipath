// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TimerNotifier)
final timerProvider = TimerNotifierProvider._();

final class TimerNotifierProvider
    extends $NotifierProvider<TimerNotifier, Map<String, TimerData>> {
  TimerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timerNotifierHash();

  @$internal
  @override
  TimerNotifier create() => TimerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, TimerData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, TimerData>>(value),
    );
  }
}

String _$timerNotifierHash() => r'91410316841089020125854ed1d6feff547e7322';

abstract class _$TimerNotifier extends $Notifier<Map<String, TimerData>> {
  Map<String, TimerData> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<Map<String, TimerData>, Map<String, TimerData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, TimerData>, Map<String, TimerData>>,
              Map<String, TimerData>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
