import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_tuner/screens/calendar.dart';
import 'firebase_options.dart';
import '../screens/login.dart';
import '../screens/kidou.dart';
import '../screens/calendar.dart';
import '../screens/sleepApplication.dart';
import '../screens/achivement.dart';
import '../screens/help.dart';
import '../screens/notice.dart';
import '../screens/pass_reset.dart';
import '../screens/pass.dart';
import '../screens/setting.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'JboyApp',
      home: SleepApp(),
    );
  }
}
