import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
      body: Stack(
        children: [
          //雲
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'images/cloud1.png',
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 500,
              child: Stack(
                children: [
                  //戻る
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: GestureDetector(
                      onTap: () {
                        print('戻る');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '＜戻る',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //ホーム画面
                  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('ホーム画面');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ホーム画面',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 2,
                            color: Color(0xff0092ac),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //カレンダ-画面
                  Positioned(
                    top: 100.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('カレンダー画面');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'カレンダー画面',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 2,
                            color: Color(0xff0092ac),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //スクリーンタイム推移
                  Positioned(
                    top: 150.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('スクリーンタイム推移');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'スクリーンタイム推移',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 2,
                            color: Color(0xff0092ac),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //実績
                  Positioned(
                    top: 200.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('実績');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '実績',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 2,
                            color: Color(0xff0092ac),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //モード設定
                  Positioned(
                    top: 250.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('モード設定');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'モード設定',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 2,
                            color: Color(0xff0092ac),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 4.0, color: Color(0xff0092ac)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
