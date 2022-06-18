import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/newsfeed_controller.dart';
import 'package:care_giver/pages/alarm/alarm_page.dart';
import 'package:care_giver/pages/hospital/hospital_page.dart';
import 'package:care_giver/pages/newsfeed/add_newsfeed.dart';
import 'package:care_giver/pages/newsfeed/news_feed_detail.dart';
import 'package:care_giver/pages/newsfeed/search_newsfeed.dart';
import 'package:care_giver/repo/newsfeed_repo.dart';
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
    return GetBuilder<NewsfeedController>(
      init: NewsfeedController(Get.find<NewsFeedRepo>()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Hello ${username.isEmpty ? 'Guest' : username}'),
            actions: [
              controller.newsfeed.isEmpty
                  ? const SizedBox(
                      width: 0,
                      height: 0,
                    )
                  : IconButton(
                      onPressed: () => Get.to(
                        () => const SearchNewsFeedPage(),
                      ),
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
            ],
          ),
          body: controller.isLoading
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Getting data"),
                      ),
                    ],
                  ),
                )
              : (controller.error.isNotEmpty && controller.newsfeed.isEmpty
                  ? Center(
                      child: Text(controller.error),
                    )
                  : RefreshIndicator(
                      onRefresh: () => controller.getAllNewsFeed(),
                      child: ListView.builder(
                        itemCount: controller.newsfeed.length,
                        itemBuilder: (context, index) {
                          final newsfeed = controller.newsfeed[index];
                          return NewsfeedCardWidget(
                            onTap: () => Get.to(
                              () => NewsFeedDetailPage(
                                newsFeed: newsfeed,
                              ),
                            ),
                            newsFeed: newsfeed,
                          );
                        },
                      ),
                    )),
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
                      onTap: () async {
                        var res = await Get.to(() => AddNewFeedPage());
                        if (res != null && res.toString().isNotEmpty) {
                          controller.getAllNewsFeed();
                        }
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
      },
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
