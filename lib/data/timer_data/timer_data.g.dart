// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerData _$TimerDataFromJson(Map<String, dynamic> json) => _TimerData(
  startTime: DateTime.parse(json['startTime'] as String),
  servings: (json['servings'] as num?)?.toInt(),
);

Map<String, dynamic> _$TimerDataToJson(_TimerData instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'servings': instance.servings,
    };
