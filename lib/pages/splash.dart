import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/auth_controller.dart';
import 'package:care_giver/network/rest_client.dart';
import 'package:care_giver/pages/auth/login.dart';
import 'package:care_giver/pages/home.dart';
import 'package:care_giver/repo/auth_repo.dart';
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
      home: const SplashPage(),
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
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    Get.find<AuthController>().getUser().then((value) {
      Get.offAll(() => HomePage(username: value));
    }).catchError((e) {
      Get.offAll(() => LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
