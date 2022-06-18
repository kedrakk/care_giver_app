import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/auth_controller.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:care_giver/pages/auth/login.dart';
import 'package:care_giver/repo/alarm_repo.dart';
import 'package:care_giver/repo/auth_repo.dart';
import 'package:care_giver/repo/hospital_repo.dart';
import 'package:care_giver/repo/newsfeed_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Care Giver',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage(),
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            RestClient(
              Dio(),
            ),
          );
          Get.put<AuthRepo>(
            AuthRepo(
              Get.find(),
            ),
          );
          Get.put(
            AuthController(
              Get.find<AuthRepo>(),
            ),
          );
          Get.lazyPut<NewsFeedRepo>(
            () => NewsFeedRepo(
              Get.find(),
            ),
          );
          Get.put<HospitalRepo>(
            HospitalRepo(
              Get.find(),
            ),
          );
          Get.put<AlarmRepo>(
            AlarmRepo(
              Get.find(),
            ),
          );
        },
      ),
    );
  }
}
