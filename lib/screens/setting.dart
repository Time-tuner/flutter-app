import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                  //ユーザー設定
                  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('ユーザー設定');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ユーザー設定',
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
                  //通知設定
                  Positioned(
                    top: 100.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('通知設定');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '通知設定',
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
                  //言語
                  Positioned(
                    top: 150.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('言語');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '言語',
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
                  //利用規約
                  Positioned(
                    top: 200.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('利用規約');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '利用規約',
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
                  //プライバシーポリシー
                  Positioned(
                    top: 250.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('プライバシーポリシー');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'プライバシーポリシー',
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
                  //ライセンス表記
                  Positioned(
                    top: 300.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('ライセンス表記');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ライセンス表記',
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
                  //よくある質問
                  Positioned(
                    top: 350.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('よくある質問');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'よくある質問',
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
                  //お問い合わせ
                  Positioned(
                    top: 400.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        print('お問い合わせ');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'お問い合わせ',
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
