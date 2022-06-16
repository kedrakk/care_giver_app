import 'package:care_giver/const/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: Column(
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
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (duration) {
                      debugPrint(duration.toString());
                    },
                  ),
                ),
                ElevatedButton(
                  child: const Text('Set Alarm'),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: const Text('06:10 PM'),
                    trailing:
                        CupertinoSwitch(value: true, onChanged: (value) {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
