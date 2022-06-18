import 'package:care_giver/network/rest_client.dart';
import 'package:dio/dio.dart';

import '../data/alarm.dart';
import '../helper/exception_helper.dart';

abstract class IAlarmRepo {
  Future<List<Alarm>> getAllAlarm();
  Future<bool> addNewAlarm(Alarm alarm);
  Future<bool> updateAlarm(Alarm alarm);
}

class AlarmRepo implements IAlarmRepo {
  final RestClient _client;
  AlarmRepo(this._client);

  @override
  Future<List<Alarm>> getAllAlarm() async {
    try {
      final response = await _client.getAllAlarm();
      return response.data.map<Alarm>((e) => Alarm.fromJson(e)).toList();
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<bool> addNewAlarm(Alarm alarm) async {
    try {
      await _client.addNewAlarm(
        alarm.alarmTime,
        alarm.flag,
      );
      return true;
    } catch (e) {
      return catchException(e as DioError);
    }
  }

  @override
  Future<bool> updateAlarm(Alarm alarm) async {
    try {
      await _client.updateAlarm(
        alarm.id,
        alarm.flag,
      );
      return true;
    } catch (e) {
      return catchException(e as DioError);
    }
  }
}
