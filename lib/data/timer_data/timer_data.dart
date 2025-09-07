import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_data.freezed.dart';
part 'timer_data.g.dart';

@freezed
abstract class TimerData with _$TimerData {
  const factory TimerData({
    required DateTime startTime,
    required int? servings,
  }) = _TimerData;

  factory TimerData.fromJson(Map<String, Object?> json) =>
      _$TimerDataFromJson(json);
}
