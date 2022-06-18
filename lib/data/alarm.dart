import 'package:json_annotation/json_annotation.dart';

part 'alarm.g.dart';

@JsonSerializable()
class Alarm {
  final int id;
  @JsonKey(name: 'alarm_time')
  final String alarmTime;
  @JsonKey(name: 'flag_id')
  final int flag;
  Alarm({
    required this.id,
    required this.alarmTime,
    required this.flag,
  });
  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmToJson(this);
}
