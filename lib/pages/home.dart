import 'package:care_giver/const/theme.dart';
import 'package:care_giver/data/news_feed.dart';
import 'package:care_giver/pages/alarm/alarm_page.dart';
import 'package:care_giver/pages/hospital/hospital_page.dart';
import 'package:care_giver/pages/newsfeed/add_newsfeed.dart';
import 'package:care_giver/widget/dialogs.dart';
import 'package:care_giver/widget/newsfeed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'auth/login.dart';
import 'auth/register.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Hello ${username.isEmpty ? 'Guest' : username}'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: NewsfeedCardWidget(
          newsFeed: NewsFeed(
            name: "name",
            instruction: "instruction",
            caution: "caution",
            photo:
                "https://w7.pngwing.com/pngs/812/897/png-transparent-kit-first-aid-kit-emergency-physician-medicine-cruz-help-rescue-bless-you-caution-doctor-thumbnail.png",
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22),
        visible: true,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: AppTheme.quaternary,
        foregroundColor: AppTheme.octonary,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          username.isNotEmpty
              ? SpeedDialChild(
                  child: const Icon(
                    Icons.logout,
                    color: AppTheme.octonary,
                  ),
                  backgroundColor: AppTheme.quaternary,
                  label: 'Logout',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  onTap: () => _logout(),
                )
              : SpeedDialChild(
                  child: const Icon(
                    Icons.login,
                    color: AppTheme.octonary,
                  ),
                  backgroundColor: AppTheme.quaternary,
                  label: 'Login',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  onTap: () => _login(),
                ),
          SpeedDialChild(
            child: const Icon(
              Icons.search,
              color: AppTheme.octonary,
            ),
            backgroundColor: AppTheme.quaternary,
            label: 'Search Hospitals',
            labelStyle: const TextStyle(fontSize: 18),
            onTap: () {
              Get.to(() => const HospitalPage());
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.alarm,
              color: AppTheme.octonary,
            ),
            backgroundColor: AppTheme.quaternary,
            label: 'Set Alarm Time',
            labelStyle: const TextStyle(fontSize: 18),
            onTap: () {
              Get.to(() => const AlarmPage());
            },
          ),
          username.isNotEmpty
              ? SpeedDialChild(
                  child: const Icon(
                    Icons.add,
                    color: AppTheme.octonary,
                  ),
                  backgroundColor: AppTheme.quaternary,
                  label: 'Add Newsfeed',
                  labelStyle: const TextStyle(fontSize: 18),
                  onTap: () {
                    Get.to(() => AddNewFeedPage());
                  },
                )
              : SpeedDialChild(),
          username.isNotEmpty
              ? SpeedDialChild(
                  child: const Icon(
                    Icons.app_registration_outlined,
                    color: AppTheme.octonary,
                  ),
                  backgroundColor: AppTheme.quaternary,
                  label: 'Registration',
                  labelStyle: const TextStyle(fontSize: 18),
                  onTap: () {
                    Get.to(() => RegisterPage());
                  },
                )
              : SpeedDialChild(),
        ],
      ),
    );
  }

  _logout() {
    Get.offAll(() => LoginPage());
    showSuccessMessage("Logout Success");
  }

  _login() {
    Get.offAll(() => LoginPage());
  }
}
