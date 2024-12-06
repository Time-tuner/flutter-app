import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  bool _isObscure = true;
  String _notificationOption = '5分';

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
                  //通知設定画面
                  Positioned(
                    top: 50.0,
                    left: 20.0,
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
                        SizedBox(height: 20),
                        //ラジオボタン

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: '5分',
                                  activeColor: Color(0xff0092ac),
                                  groupValue: _notificationOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _notificationOption = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  '5分',
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
                                  value: '10分',
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
                                  '10分',
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
                                  value: '15分',
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
                                  '15分',
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
                                  value: '20分',
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
                                  '20分',
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
                                  value: 'なし',
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
                                  'なし',
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
