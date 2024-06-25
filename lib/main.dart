import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// 予定データのモデル
class Schedule {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final Color color;

  Schedule({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.color,
  });
}

void main() {
  runApp(MyApp());
}

// アプリ全体のウィジェット
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetuner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// ホーム画面
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Schedule> _schedules = []; // 予定のリスト

  double _calculateAngleFromTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute;
    return (hour * 60 + minute) / (24 * 60) * 360;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(hours: 12), // 12時間のアニメーション
      vsync: this,
    );

    final now = DateTime.now();
    final currentAngle = _calculateAngleFromTime(now);

    _animation = Tween<double>(begin: currentAngle, end: currentAngle + 360)
        .animate(_controller)
      ..addListener(() {
        setState(() {}); // アニメーションに合わせて状態を更新
      });
    _controller.repeat(); // アニメーションを繰り返す
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timetuner'),
          backgroundColor: Colors.cyan,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu , color: Colors.white,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 181, 255, 96),
                ),
                child: Text('Timetuner',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('ホーム'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('カレンダー'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('推移'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text('実績'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('モード設定'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('ヘルプ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('設定'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                color: Colors.cyan,
                height: 150,
                child: Center(
                  child: Text(
                    '終日の予定がここに表示されます',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // 予定追加画面への遷移
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduleAddScreen(
                          onScheduleAdded: (schedule) {
                            setState(() {
                              _schedules.add(schedule);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: Size(300, 300), // 円のサイズ
                        painter:
                            ClockPainter(_animation.value, _schedules), // 時計の描画
                      ),
                      // キャラクターの描画
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          final needleEnd = Offset(
                            150 + 150 * cos((_animation.value +20) * pi / 180 ),
                            150 + 150 * sin((_animation.value ) * pi / 180 ),
                          );

                          final screenSize = MediaQuery.of(context).size;
                          final circleOffsetX = screenSize.width / 2 - 150;
                          final circleOffsetY =
                              screenSize.height / 2 - 150 - 150;
                          return Positioned(
                            left: circleOffsetX +
                                needleEnd.dx -15
                                , // needleEnd.dx を使う
                            top: circleOffsetY +
                                needleEnd.dy -
                                10, // needleEnd.dy を使う
                            child: Transform.rotate(
                              angle: _animation.value * pi / 180 - pi / 2,
                              child: Image.asset(
                                'assets/futaba.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// 時計の描画クラス
class ClockPainter extends CustomPainter {
  final double angle;
  final List<Schedule> schedules;

  ClockPainter(this.angle, this.schedules);

  @override
  void paint(Canvas canvas, Size size) {
    // 円の描画
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // 時計の針の描画
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 -5 ; // 針の長さ
    final angleRadians = angle * (pi / 180); // 度からラジアンに変換
    final needleEnd = Offset(
      center.dx + radius * cos(angleRadians),
      center.dy + radius * sin(angleRadians),
    );
    canvas.drawLine(center, needleEnd, Paint()..color = Colors.brown);

    // キャラクターの描画
    // final characterImage =
    // final characterSize = 30.0;
    // final characterRect = Rect.fromCenter(
    //   center: needleEnd,
    //   width: characterSize,
    //   height: characterSize,
    // );
    // paintImage(
    //   canvas: canvas,
    //   image: characterImage,
    //   rect: characterRect,
    //   fit: BoxFit.cover,
    // );

    // 予定部分の描画
    final now = DateTime.now();
    for (final schedule in schedules) {
      // 予定時間から角度を計算
      final startTimeAngle = _calculateAngleFromTime(schedule.startTime);
      final endTimeAngle = _calculateAngleFromTime(schedule.endTime);

      // 予定時間が過去ならグレーアウト処理
      final isPast = now.isAfter(schedule.endTime);

      // 予定時間を塗りつぶす
      final sweepAngle = endTimeAngle - startTimeAngle;
      final schedulePaint = Paint()
        ..color = isPast ? Colors.grey : schedule.color
        ..style = PaintingStyle.fill;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        startTimeAngle * (pi / 180) - pi / 2,
        sweepAngle * (pi / 180),
        true,
        schedulePaint,
      );
    }
  }

  // 時間から角度を計算するヘルパー関数
  double _calculateAngleFromTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute;
    return (hour * 60 + minute) / (24 * 60) * 360;
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return oldDelegate.angle != angle ||
        !listEquals(oldDelegate.schedules, schedules);
  }
}

// 予定追加画面
class ScheduleAddScreen extends StatefulWidget {
  final Function(Schedule) onScheduleAdded; // 予定を追加したときに呼び出す関数

  ScheduleAddScreen({required this.onScheduleAdded});

  @override
  _ScheduleAddScreenState createState() => _ScheduleAddScreenState();
}

class _ScheduleAddScreenState extends State<ScheduleAddScreen> {
  final _formKey = GlobalKey<FormState>(); // フォームのバリデーション用
  final _titleController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  Color _selectedColor = Colors.blue;

  @override
  void dispose() {
    _titleController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('色を選択'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: _selectedColor,
            onColorChanged: (color) {
              setState(() {
                _selectedColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('予定を追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '予定タイトル',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '予定タイトルを入力してください';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _startTimeController,
                decoration: InputDecoration(
                  labelText: '開始時間 (HH:MM)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '開始時間を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _endTimeController,
                decoration: InputDecoration(
                  labelText: '終了時間 (HH:MM)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '終了時間を入力してください';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // 色選択のUI (例えば、カラーピッカーなど)
              ElevatedButton(
                onPressed: _showColorPicker, // カラーピッカーを表示
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedColor,
                ),
                child: Text('色を選択'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // 予定データを作成
                    final title = _titleController.text;
                    final startTime = DateTime.parse(
                        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${_startTimeController.text}');
                    final endTime = DateTime.parse(
                        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${_endTimeController.text}');
                    final schedule = Schedule(
                      title: title,
                      startTime: startTime,
                      endTime: endTime,
                      color: _selectedColor,
                    );

                    // 予定を追加して、ホーム画面に戻る
                    widget.onScheduleAdded(schedule);
                    Navigator.pop(context);
                  }
                },
                child: Text('予定を追加'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
