import 'package:care_giver/data/alarm.dart';
import 'package:get/get.dart';

import '../repo/alarm_repo.dart';

class AlarmController extends GetxController {
  final IAlarmRepo _repo;
  AlarmController(this._repo);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Alarm> _alarmList = [];
  List<Alarm> get alarmList => _alarmList;

  String _error = '';
  String get error => _error;

  late DateTime _setDateTime;
  DateTime get setDateTime => _setDateTime;

  getAllAlarms() async {
    _isLoading = true;
    update();
    try {
      _alarmList = await _repo.getAllAlarm();
      _error = _alarmList.isEmpty ? 'No Alarm Yet' : '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<bool> addNewAlarm(Alarm alarm) async {
    try {
      final response = await _repo.addNewAlarm(alarm);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateAlarm(Alarm alarm) async {
    try {
      final response = await _repo.updateAlarm(alarm);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  changeDateTime(DateTime newDateTime) {
    _setDateTime = newDateTime;
    update();
  }

  @override
  void onInit() {
    _setDateTime = DateTime.now();
    getAllAlarms();
    super.onInit();
  }
}
