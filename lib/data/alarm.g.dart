// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) => Alarm(
      id: json['id'] as int,
      alarmTime: json['alarm_time'] as String,
      flag: json['flag_id'] as int,
    );

Map<String, dynamic> _$AlarmToJson(Alarm instance) => <String, dynamic>{
      'id': instance.id,
      'alarm_time': instance.alarmTime,
      'flag_id': instance.flag,
    };
