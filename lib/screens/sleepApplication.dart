import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SleepApp extends StatefulWidget {
  const SleepApp({Key? key}) : super(key: key);

  @override
  State<SleepApp> createState() => _SleepAppState();
}

class _SleepAppState extends State<SleepApp> {
  bool _isObscure = true;

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0092ac),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 200,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset("images/Group 299.png"),
                  ),
                ),
                Container(
                  width: 400,
                  height: 300,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset("images/Group 300.png"),
                  ),
                ),
                Container(
                  width: 400,
                  height: 120,
                  padding: const EdgeInsets.only(top: 70, left: 50),
                  child: Text(
                    "～おやすみ中～",
                    style: TextStyle(fontSize: 40, color: Color(0xfffafafa)),
                  ),
                ),
                Container(
                  width: 400,
                  height: 150,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset("images/Group 301.png"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
