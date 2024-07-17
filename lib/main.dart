import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_tuner/screens/schedule_add_screen.dart'; // 新しいファイルをインポート
import 'dart:ui' as ui;

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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Schedule> _schedules = [];

  double _calculateAngleFromTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute;
    return (hour * 60 + minute) / (24 * 60) * 360;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(hours: 24),
      vsync: this,
    );

    final now = DateTime.now();
    final currentAngle = _calculateAngleFromTime(now);

    _animation = Tween<double>(begin: currentAngle, end: currentAngle + 360)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final circleDiameter = screenSize.width * 0.85;
    final circleRadius = circleDiameter / 2;
    final barColor = Color.fromRGBO(0, 146, 172, 1); // 上のバーの色

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        leadingWidth: screenSize.width,
        backgroundColor: barColor,
        leading: Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                IconButton(
                  padding: EdgeInsets.all(20),
                  icon: const Icon(Icons.menu, size: 40, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Positioned(
                  left: 200,
                  top: -50,
                  child: Image.asset(
                    'assets/cloud2.png',
                    width: 250, // 雲の画像のサイズをさらに大きく
                    height: 250,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(222, 240, 221, 1),
              ),
              child: Text(
                'Timetuner',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            ListTile(
              tileColor: Color.fromRGBO(222, 240, 221, 1),
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
      body: Container(
        color: barColor,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    color: barColor,
                    height: 80,
                    child: Center(
                      child: Text(
                        _schedules.isNotEmpty
                            ? _schedules.map((e) => '${e.title}').join('\n')
                            : '',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                                insetPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Container(
                                  width: screenSize.width * 0.85,
                                  height: screenSize.height * 0.6,
                                  child: ScheduleAddScreen(
                                    onScheduleAdded: (schedule) {
                                      setState(() {
                                        _schedules.add(schedule);
                                        _schedules.sort((a, b) =>
                                            a.startTime.compareTo(b.startTime));
                                      });
                                    },
                                  ),
                                ),
                              )).then((_) => setState(() {}));
                    },
                    child: Container(
                      color: Colors.white,
                      width: screenSize.width,
                      height: screenSize.height * 0.48,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(circleDiameter, circleDiameter),
                            painter: ClockPainter(
                                _animation.value, _schedules, circleRadius),
                          ),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              final characterAngle =
                                  360 - ((_animation.value + 90) % 360) + 5;

                              final characterPosition = Offset(
                                screenSize.width / 2 -
                                    (circleRadius * 0.93) *
                                        cos(characterAngle * pi / 180),
                                screenSize.height * 0.48 / 2 +
                                    (circleRadius * 0.93) *
                                        sin(characterAngle * pi / 180),
                              );

                              return Positioned(
                                left: characterPosition.dx - 20,
                                top: characterPosition.dy - 20,
                                child: Transform.rotate(
                                  angle: (_animation.value - 180) * pi / 180,
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
            ),
          ],
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final double angle;
  final List<Schedule> schedules;
  final double radius;

  ClockPainter(this.angle, this.schedules, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.grey[300]!
        ..style = PaintingStyle.fill,
    );

    final hourAngle = 360 / 24;
    for (int i = 0; i < 24; i++) {
      final tickAngle = i * hourAngle;
      final tickLength = i % 6 == 0 ? 15.0 : 8.0;

      canvas.drawLine(
        _calculatePointOnCircle(center, radius - tickLength, tickAngle),
        _calculatePointOnCircle(center, radius, tickAngle),
        Paint()..color = Colors.black,
      );

      if (i % 6 == 0) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: '$i',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          textDirection: ui.TextDirection.ltr,
        );
        textPainter.layout();

        final textOffset =
            _calculatePointOnCircle(center, radius + 12, tickAngle - 90);
        textPainter.paint(
            canvas,
            Offset(textOffset.dx - textPainter.width / 2,
                textOffset.dy - textPainter.height / 2));
      }
    }

    canvas.drawLine(
      center,
      _calculatePointOnCircle(center, radius - 5, angle - 90),
      Paint()..color = Colors.brown,
    );

    _drawSchedules(canvas, size, center, radius);

    final elapsedPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle * pi / 180,
      true,
      elapsedPaint,
    );
  }

  void _drawSchedules(Canvas canvas, Size size, Offset center, double radius) {
    final now = DateTime.now();
    for (var i = 0; i < schedules.length; i++) {
      final schedule = schedules[i];
      final startTimeAngle = _calculateAngleFromTime(schedule.startTime);
      final endTimeAngle = _calculateAngleFromTime(schedule.endTime);
      final isPast = now.isAfter(schedule.endTime);

      var startAngle = startTimeAngle - 90;
      var endAngle = endTimeAngle - 90;

      if (endAngle < startAngle) {
        endAngle += 360;
      }

      final schedulePaint = Paint()
        ..color = (isPast ? Colors.grey : schedule.color).withOpacity(0.5)
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle * pi / 180,
        (endAngle - startAngle) * pi / 180,
        true,
        schedulePaint,
      );
    }
  }

  Offset _calculatePointOnCircle(Offset center, double radius, double angle) {
    final angleInRadians = angle * pi / 180;
    return Offset(
      center.dx + radius * cos(angleInRadians),
      center.dy + radius * sin(angleInRadians),
    );
  }

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
