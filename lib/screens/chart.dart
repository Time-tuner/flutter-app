import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:time_tuner/screens/home.dart';

class ChartScreen extends StatelessWidget {
  final List<Schedule> schedules;

  ChartScreen({required this.schedules});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final barColor = Color.fromRGBO(0, 146, 172, 1);
    return Scaffold(
      backgroundColor: barColor,
      appBar: AppBar(
        toolbarHeight: 200,
        leadingWidth: screenSize.width,
        backgroundColor: barColor,
        leading: Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
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
      body: Center(
      child:Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.5,
              child: BarChart(
                BarChartData(
                  backgroundColor: Colors.white,
                  alignment: BarChartAlignment.spaceAround,
                  barGroups: _createBarGroups(),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(fontSize: 14, color: Colors.white);
                        Widget text;
                        switch (value.toInt()) {
                          case 0:
                            text = Text('日', style: style);
                            break;
                          case 1:
                            text = Text('月', style: style);
                            break;
                          case 2:
                            text = Text('火', style: style);
                            break;
                          case 3:
                            text = Text('水', style: style);
                            break;
                          case 4:
                            text = Text('木', style: style);
                            break;
                          case 5:
                            text = Text('金', style: style);
                            break;
                          case 6:
                            text = Text('土', style: style);
                            break;
                          default:
                            text = Text('', style: style);
                            break;
                        }
                        return SideTitleWidget(child: text, axisSide: meta.axisSide
                        );
                      },
                    )),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '週合計は${_calculateTotalHours()}時間！頑張ってるね！！',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final weeklyData = _aggregateWeeklyData();
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: weeklyData[index].fold(0, (sum, item) => sum + item.hours.toDouble()),
            rodStackItems: weeklyData[index].map((data) {
              return BarChartRodStackItem(
                data.start.toDouble(),
                data.end.toDouble(),
                data.color,
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  List<List<StackedBarData>> _aggregateWeeklyData() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday % 7));
    final data = List.generate(7, (index) => <StackedBarData>[]);

    for (var i = 0; i < 7; i++) {
      final day = startOfWeek.add(Duration(days: i));
      final schedulesForDay = schedules.where((schedule) {
        return schedule.startTime.day == day.day &&
            schedule.startTime.month == day.month &&
            schedule.startTime.year == day.year &&
            !schedule.isAllDay;
      });

      double cumulativeHours = 0;
      for (var schedule in schedulesForDay) {
        final duration = schedule.endTime.difference(schedule.startTime).inHours;
        data[i].add(StackedBarData(
          start: cumulativeHours,
          end: cumulativeHours + duration,
          hours: duration,
          color: schedule.color,
        ));
        cumulativeHours += duration;
      }
    }

    return data;
  }

  int _calculateTotalHours() {
    return schedules.fold(0, (total, schedule) {
      if (!schedule.isAllDay) {
        return total + schedule.endTime.difference(schedule.startTime).inHours;
      }
      return total;
    });
  }
}

class StackedBarData {
  final double start;
  final double end;
  final int hours;
  final Color color;

  StackedBarData({
    required this.start,
    required this.end,
    required this.hours,
    required this.color,
  });
}
