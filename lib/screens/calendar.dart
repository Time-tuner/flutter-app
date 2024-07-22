import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

//カレンダーウィジェットの定義
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  bool _isObscure = true;

  //カレンダーの表示形式（月表示）
  CalendarFormat _calendarFormat = CalendarFormat.month;
  //現在フォーカスされている日
  DateTime _focusedDay = DateTime.now();
  //選択された日
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    //日本語ロケールを初期化
    initializeDateFormatting('ja_JP');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0092ac),
        leading: Builder(builder: (context) {
          return IconButton(
            iconSize: 36.0, // ハンバーガーメニューのサイズを大きくする
            icon: Icon(Icons.menu, color: Color(0xfffafafa)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Menu Button Pressed!'),
                backgroundColor: Color(0xfffafafa),
                duration: const Duration(milliseconds: 400),
              ));
            },
          );
        }),
      ),
      body: Container(
        //カレンダー以外の部分の背景色
        color: Color(0xff0092ac),
        child: Center(
          child: Column(
            children: [
              // Container(
              //   width: 400,
              //   height: 80,
              //   child: Row(
              //     children: [
              //       // Spacer(), // 画像の前にスペーサーを追加して残りのスペースを埋める
              //       // FittedBox(
              //       //   fit: BoxFit.fitHeight,
              //       //   child: Image.asset("images/Group 88.png"),
              //       // ),
              //     ],
              //   ),
              // ),
              //カレンダーの上部に年月表示と矢印ボタンを配置
              Container(
                color: Color(0xff0092ac), // 年月表示部分の背景色を設定
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      // 現在の年月表示
                      child: Text(
                        '${_focusedDay.year}年${_focusedDay.month}月',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    //前月への矢印ボタン
                    Transform.rotate(
                        angle: pi / 2,
                        child: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _focusedDay = DateTime(_focusedDay.year,
                                      _focusedDay.month - 1, 1);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color(0xfffafafa),
                            ))),
                    //次月への矢印ボタン
                    Transform.rotate(
                        angle: pi / 2 / -1,
                        child: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _focusedDay = DateTime(_focusedDay.year,
                                      _focusedDay.month + 1, 1);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color(0xfffafafa),
                            ))),
                  ],
                ),
              ),
              // 曜日表示
              Container(
                color: Color(0xff0092ac), // 曜日部分の背景色を設定
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('日',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                      Text('月',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                      Text('火',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                      Text('水',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                      Text('木',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                      Text('金',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                      Text('土',
                          style: TextStyle(
                              color: Color(0xfffafafa), fontSize: 16)),
                    ]),
              ),
              //白い四角形の上にカレンダーを表示
              Expanded(
                // Expandedウィジェットを使用して縦に広げる
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(0), // 丸角をなくす
                    border: Border.all(color: Color(0xff057992)), // カレンダー周りの線
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      //カレンダーのロケールを日本語に設定
                      locale: 'ja_JP',
                      //カレンダー最初の日
                      firstDay: DateTime.utc(2020, 1, 1),
                      //カレンダー最後の日
                      lastDay: DateTime.utc(2030, 12, 31),
                      //現在フォーカスされている日
                      focusedDay: _focusedDay,
                      //availableGestures: AvailableGestures.all,
                      //カレンダーの表示形式
                      calendarFormat: _calendarFormat,
                      availableCalendarFormats: const {
                        CalendarFormat.month: '月',
                        CalendarFormat.week: '週',
                      }, // 2週間表示を削除
                      selectedDayPredicate: (day) {
                        //選択された日と同じ日かどうかを判定
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          //選択された日を更新
                          _selectedDay = selectedDay;
                          //フォーカスされた日を更新
                          _focusedDay = focusedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            //カレンダーの表示形式を更新
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        //ページ変更された時にフォーカスされた日を更新
                        _focusedDay = focusedDay;
                      },
                      //デフォルト設定年月削除
                      headerVisible: false,
                      //デフォルト設定曜日削除
                      daysOfWeekVisible: false,
                      //カレンダーの日付のビルダー（選択日と今日の日のデザインをカスタマイズ）
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, date, events) {
                          final isSaturday = date.weekday == DateTime.saturday;
                          final isSunday = date.weekday == DateTime.sunday;
                          return Container(
                            margin: EdgeInsets.zero,
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                //カレンダー内部の罫線
                                color: Color(0xff0b98b7),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(
                                    color: isSaturday
                                        ? Colors.blue
                                        : isSunday
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        /*defaultBuilder: (context, date, events) => Container(
                            //セル間の間隔をなくす
                            margin: EdgeInsets.zero,
                            //セル幅の設定
                            width: double.infinity,
                            //セルの高さを設定
                            height: 100.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff0b98b7),
                              ),
                            ),
                            child: Column(
                              //上部に配置
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Color(0xff000000)),
                                )
                              ],
                            )),*/
                        selectedBuilder: (context, date, events) => Container(
                            //セル間の間隔をなくす
                            margin: EdgeInsets.zero,
                            //セル幅の設定
                            width: double.infinity,
                            //セルの高さを設定
                            height: 100.0,
                            decoration: BoxDecoration(
                              //選択された日の背景色
                              color: Color(0xff0b98b7).withOpacity(0.6),

                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                  color: Color(0xff0b98b7)), // カレンダー内部の罫線
                            ),
                            child: Column(
                              //上部に配置
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Color(0xff000000)),
                                )
                              ],
                            )),
                        todayBuilder: (context, date, events) => Container(
                            //セル間の間隔をなくす
                            margin: EdgeInsets.zero,
                            //セル幅の設定
                            width: double.infinity,
                            //セルの高さを設定
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xff0B98B7).withOpacity(
                                  0.2), // 当日の背景色を透明度20%のColor(0xff0B98B7)に設定
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                  color: Color(0xff0b98b7)), // カレンダー内部の罫線
                            ),
                            child: Column(
                              //上部に配置
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Color(0xff000000)),
                                )
                              ],
                            )),
                        outsideBuilder: (context, date, events) => Container(
                            //セル間の間隔をなくす
                            margin: EdgeInsets.zero,
                            //セル幅の設定
                            width: double.infinity,
                            //セルの高さを設定
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                  color: Color(0xff0b98b7)), // カレンダー内部の罫線
                            ),
                            child: Column(
                              //上部に配置
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Color(0xff000000)),
                                )
                              ],
                            )),
                      ),
                      //罫線のデザイン
                      daysOfWeekStyle: DaysOfWeekStyle(
                        //平日の文字色を黒に設定
                        weekdayStyle: TextStyle(color: Colors.black),
                        // weekendStyle: TextStyle(color: Colors.red),
                        // //土曜日の文字の色を青に設定
                      ),
                      calendarStyle: CalendarStyle(
                        defaultDecoration: BoxDecoration(
                          //デフォルトの日付セルの背景色を白に設定
                          color: Color(0xfffafafa),
                          //日付セルの罫線の色を設定
                          border: Border.all(
                              color: Color(0xff0b98b7)), // カレンダー内部の罫線
                        ),
                        weekendDecoration: BoxDecoration(
                          //週末の日付セルの背景色を白に設定
                          color: Color(0xfffafafa),
                          //週末の日付セルの罫線の色を設定
                          border: Border.all(
                              color: Color(0xff0b98b7)), // カレンダー内部の罫線
                        ),
                        outsideDecoration: BoxDecoration(
                          //前月・次月の日付セルの背景色を白に設定
                          color: Color(0xfffafafa),
                          //前月・次月の日付セルの罫線の色を設定
                          border: Border.all(
                              color: Color(0xff0b98b7)), // カレンダー内部の罫線
                        ),
                        selectedDecoration: BoxDecoration(
                          // 選択された日の場合、色をなくすためにnullを設定
                          color: null,
                          borderRadius: BorderRadius.circular(0), // 丸角をなくす
                        ),
                        todayDecoration: BoxDecoration(
                          color: Color(0xff0B98B7).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(0), // 丸角をなくす
                          //今日の日付セルの罫線の色を設定
                          border: Border.all(
                              color: Color(0xff0b98b7)), // カレンダー内部の罫線
                        ),
                        //セル間のマージンをなくす
                        cellMargin: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
