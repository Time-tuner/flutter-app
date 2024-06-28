import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:time_tuner/screens/login.dart';

class KidouPage extends StatefulWidget {
  const KidouPage({Key? key}) : super(key: key);

  @override
  State<KidouPage> createState() => _KidouPageState();
}

class _KidouPageState extends State<KidouPage> {
  // Timer宣言
  Timer? timer;
  @override
  void initState() {
    super.initState();

    // Timerインスタンス作成
    // Timerの引数は遅延時間と経過時間後の操作を記したコールバック関数の二つを搭載
    timer = Timer(
      const Duration(seconds: 5),
      () {
        // コールバックを渡す
        print('遷移完了');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // タイマーが終わるべき時タイマーを破棄。リソース解放
    super.dispose();
    // コールバック関数をやめさせる
    timer?.cancel();
  }

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
              Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                        width: 700,
                        height: 70,
                        child: Text(
                          'Timetuner',
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 50,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          height: 100,
                          child: Image.asset("images/cloud1.png")),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(right: 0),
                        width: 400,
                        height: 200,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image.asset("images/Group 296.png"),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    "images/ground2.png",
                    width: 500,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.only(right: 0),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset("images/ふたばちゃん1.png"),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    top: 20,
                    child: Image.asset(
                      'images/cloud1.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      'images/Group 295.png',
                      width: 600,
                      height: 300,
                    ),
                  ),
                ],
              ),
              // 下部のスペース
              SizedBox(
                width: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
