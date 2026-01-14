// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerData _$TimerDataFromJson(Map<String, dynamic> json) => _TimerData(
  startTime: DateTime.parse(json['start_time'] as String),
  servings: (json['servings'] as num?)?.toInt(),
  runningSteps: (json['running_steps'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, DateTime.parse(e as String)),
  ),
);

Map<String, dynamic> _$TimerDataToJson(_TimerData instance) =>
    <String, dynamic>{
      'start_time': instance.startTime.toIso8601String(),
      'servings': instance.servings,
      'running_steps': instance.runningSteps.map(
        (k, e) => MapEntry(k, e.toIso8601String()),
      ),
    };
