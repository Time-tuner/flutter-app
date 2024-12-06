import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:time_tuner/screens/help.dart';

class SleepWeekPage extends StatefulWidget {
  const SleepWeekPage({Key? key}) : super(key: key);

  @override
  State<SleepWeekPage> createState() => _SleepWeekPageState();
}

class _SleepWeekPageState extends State<SleepWeekPage> {
  bool _isSwitched = false; // 曜日ごとの設定スイッチ

  // 曜日ごとの時間データ
  final List<Map<String, dynamic>> _daySettings = [
    {
      'day': '月',
      'start': TimeOfDay(hour: 22, minute: 0),
      'end': TimeOfDay(hour: 8, minute: 0)
    },
    {
      'day': '火',
      'start': TimeOfDay(hour: 21, minute: 0),
      'end': TimeOfDay(hour: 6, minute: 0)
    },
    {
      'day': '水',
      'start': TimeOfDay(hour: 21, minute: 0),
      'end': TimeOfDay(hour: 6, minute: 0)
    },
    {
      'day': '木',
      'start': TimeOfDay(hour: 21, minute: 0),
      'end': TimeOfDay(hour: 6, minute: 0)
    },
    {
      'day': '金',
      'start': TimeOfDay(hour: 22, minute: 0),
      'end': TimeOfDay(hour: 8, minute: 0)
    },
    {
      'day': '土',
      'start': TimeOfDay(hour: 22, minute: 0),
      'end': TimeOfDay(hour: 8, minute: 0)
    },
    {
      'day': '日',
      'start': TimeOfDay(hour: 22, minute: 0),
      'end': TimeOfDay(hour: 8, minute: 0)
    },
  ];

  // 時間選択ダイアログを表示
  Future<void> _selectTime(
      BuildContext context, int index, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          isStart ? _daySettings[index]['start'] : _daySettings[index]['end'],
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _daySettings[index]['start'] = picked;
        } else {
          _daySettings[index]['end'] = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0092ac),
      body: Stack(
        children: [
          //雲の背景
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
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // ヘッダー
                  Text(
                    'ロック時間の設定',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 2,
                    color: const Color(0xff0092ac),
                  ),
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
                        onChanged: (bool value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 曜日ごとの時間設定リスト
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        itemCount: _daySettings.length,
                        itemBuilder: (context, index) {
                          final daySetting = _daySettings[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //曜日
                                Text(
                                  daySetting['day'],
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                                //時間設定
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          _selectTime(context, index, true),
                                      child: Text(
                                        '開始: ${daySetting['start'].format(context)}',
                                        style:
                                            const TextStyle(color: Colors.teal),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '～',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () =>
                                          _selectTime(context, index, false),
                                      child: Text(
                                        '終了: ${daySetting['end'].format(context)}',
                                        style:
                                            const TextStyle(color: Colors.teal),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
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
                  const SizedBox(height: 8),
                ],
              ),

              //枠組み
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
