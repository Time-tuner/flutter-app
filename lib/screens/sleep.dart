import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:time_tuner/screens/help.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  bool _isSwitched = false; // 曜日ごとのスイッチの状態
  TimeOfDay _startTime = TimeOfDay(hour: 23, minute: 0); // 初期開始時間
  TimeOfDay _endTime = TimeOfDay(hour: 7, minute: 0); // 初期終了時間

  // 時間選択ダイアログを表示する関数
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0092ac), // 背景色
      body: Stack(
        children: [
          // 背景の装飾
          Positioned(
            right: 5,
            child: Image.asset(
              'images/cloud1.png',
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            bottom: 20,
            left: -50,
            child: Image.asset(
              'images/cloud1.png',
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            top: 300,
            right: -40,
            child: Image.asset(
              'images/cloud1.png',
              width: 120,
              height: 120,
            ),
          ),
          // メインコンテンツ
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 400,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xff0092ac), width: 4.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // タイトル
                  const Text(
                    '安心Sleep',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(color: Color(0xff0092ac), thickness: 2.0),
                  const SizedBox(height: 10),
                  // 曜日ごとのスイッチ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '曜日ごと',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Switch(
                        value: _isSwitched,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // 開始時間設定
                  GestureDetector(
                    onTap: () => _selectTime(context, true),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '開始',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _startTime.format(context),
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 終了時間設定
                  GestureDetector(
                    onTap: () => _selectTime(context, false),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '終了',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _endTime.format(context),
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // 変更ボタン
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // 設定変更処理
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('設定が保存されました！'),
                            backgroundColor: Colors.teal,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0092ac),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text('変更'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
