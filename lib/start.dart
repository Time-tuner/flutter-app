import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('スタート画面')),
      body: Center(
        child: Text('これはスタート画面です', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
