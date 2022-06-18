import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/alarm_controller.dart';
import 'package:care_giver/data/alarm.dart';
import 'package:care_giver/helper/extension_helper.dart';
import 'package:care_giver/repo/alarm_repo.dart';
import 'package:care_giver/widget/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: GetBuilder(
        init: AlarmController(
          Get.find<AlarmRepo>(),
        ),
        builder: (AlarmController controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Alarm Timer',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const Divider(
                      color: AppTheme.nonary,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 3,
                      child: CupertinoDatePicker(
                        initialDateTime: controller.setDateTime,
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (duration) {
                          controller.changeDateTime(duration);
                        },
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Set Alarm'),
                      onPressed: () {
                        var newDateTime = DateFormat('HH:mm:ss')
                            .format(controller.setDateTime)
                            .toString();
                        _addAlarm(newDateTime);
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                child: controller.alarmList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.alarmList.length,
                        itemBuilder: (context, index) {
                          final alarm = controller.alarmList[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: ListTile(
                              title: Text(
                                alarm.alarmTime.toTimeOnly(),
                              ),
                              trailing: CupertinoSwitch(
                                value: alarm.flag > 0 ? true : false,
                                onChanged: (value) {
                                  _updateAlarm(value, alarm);
                                },
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          controller.error,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  _addAlarm(String dateTime) {
    showLoadingDialog();
    Get.find<AlarmController>()
        .addNewAlarm(
      Alarm(
        id: 0,
        alarmTime: dateTime,
        flag: 1,
      ),
    )
        .then((value) {
      dismissDialog();
      showSuccessMessage("Add Success");
      Get.find<AlarmController>().getAllAlarms();
    }).catchError((e) {
      dismissDialog();
      showErrorMessage(e.toString());
    });
  }

  _updateAlarm(bool newVal, Alarm alarm) {
    showLoadingDialog();
    Get.find<AlarmController>()
        .updateAlarm(
      Alarm(
        id: alarm.id,
        alarmTime: alarm.alarmTime,
        flag: newVal ? 1 : 0,
      ),
    )
        .then((value) {
      dismissDialog();
      showSuccessMessage("Update Success");
      Get.find<AlarmController>().getAllAlarms();
    }).catchError((e) {
      dismissDialog();
      showErrorMessage(e.toString());
    });
  }
}
