import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:time_tuner/main.dart'; // Scheduleクラスをインポートするためにmain.dartをインポート
import 'dart:ui'as ui;

class ScheduleAddScreen extends StatefulWidget {
  final Function(Schedule) onScheduleAdded;

  ScheduleAddScreen({required this.onScheduleAdded});

  @override
  _ScheduleAddScreenState createState() => _ScheduleAddScreenState();
}

class _ScheduleAddScreenState extends State<ScheduleAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();
  Color _selectedColor = Colors.blue;
  bool _allDay = false;
  bool _privateMode = false;

  @override
  void dispose() {
    _titleController.dispose();
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    if (_allDay) return;
    final TimeOfDay? picked = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dialOnly,

      context: context,
      initialTime: isStartTime ? _selectedStartTime : _selectedEndTime,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = picked;
        } else {
          _selectedEndTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final startTime = DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  _selectedStartTime.hour,
                  _selectedStartTime.minute,
                );
                final endTime = DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  _selectedEndTime.hour,
                  _selectedEndTime.minute,
                );

                if (!_allDay && endTime.isBefore(startTime)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('終了時間は開始時間より後にしてください')),
                  );
                  return;
                }

                final schedule = Schedule(
                  title: _titleController.text,
                  startTime: _allDay
                      ? DateTime(_selectedDate.year, _selectedDate.month,
                          _selectedDate.day, 0, 0)
                      : startTime,
                  endTime: _allDay
                      ? DateTime(_selectedDate.year, _selectedDate.month,
                          _selectedDate.day, 23, 59)
                      : endTime,
                  color: _selectedColor,
                );

                widget.onScheduleAdded(schedule);
                Navigator.pop(context);
              }
            },
            child: Text(
              '保存',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
        leading: TextButton(
         
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'キャンセル',
            style: TextStyle(color: Colors.blue, fontSize: 18),
            textDirection: ui.TextDirection.ltr,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'タイトルを追加',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'タイトルを入力してください';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('終日'),
                value: _allDay,
                onChanged: (bool value) {
                  setState(() {
                    _allDay = value;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.grey),
                title: Text('日付'),
                trailing: Text(
                  '${DateFormat('yyyy/MM/dd').format(_selectedDate)}',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () => _selectDate(context),
              ),
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.grey),
                title: Text('開始時間'),
                trailing: Text(
                  '${_allDay ? '終日' : _selectedStartTime.format(context)}',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () => _selectTime(context, true),
              ),
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.grey),
                title: Text('終了時間'),
                trailing: Text(
                  '${_allDay ? '終日' : _selectedEndTime.format(context)}',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () => _selectTime(context, false),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('カラー'),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: _showColorPicker,
                    child: Container(
                      width: 24,
                      height: 24,
                      color: _selectedColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('プライベートモード'),
                value: _privateMode,
                onChanged: (bool value) {
                  setState(() {
                    _privateMode = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
