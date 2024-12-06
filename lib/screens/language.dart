import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:time_tuner/screens/help.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool _isObscure = true;
  String _notificationOption = '日本語';

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
          Positioned(
            right: 5,
            child: Image.asset(
              'images/cloud1.png',
            ),
          ),
          Positioned(
            top: 450,
            child: Image.asset(
              'images/cloud1.png',
            ),
          ),
          Positioned(
            right: -50,
            top: 300,
            child: Image.asset(
              'images/cloud1.png',
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 400,
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
                  //言語設定画面
                  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '言語',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 2,
                          color: Color(0xff0092ac),
                        ),

                        SizedBox(height: 20),
                        //ラジオボタン

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 70),
                            Row(
                              children: [
                                Radio<String>(
                                  value: '日本語',
                                  activeColor: Color(0xff0092ac),
                                  groupValue: _notificationOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _notificationOption = value!;
                                    });
                                  },
                                ),
                                SizedBox(width: 60),
                                Text(
                                  '日本語',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, // 文字を太くする
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Radio<String>(
                                  value: '英語',
                                  activeColor: Color(0xff0092ac),
                                  groupValue: _notificationOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _notificationOption = value!;
                                    });
                                  },
                                ),
                                SizedBox(width: 60),
                                Text(
                                  '英語',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, // 文字を太くする
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
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
