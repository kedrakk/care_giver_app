import 'package:care_giver/const/theme.dart';
import 'package:care_giver/pages/auth/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Giver',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}
