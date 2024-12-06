import 'package:flutter/material.dart';

import 'start.dart';  // StartScreen をインポート

class NextScreen extends StatelessWidget {
  final String username;

  NextScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, 
      appBar: AppBar(title: Text('次の画面')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '入力されたユーザー名: $username',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // URL発行の処理をここに追加
                  print('URLを発行する');
                },
                child: Text(
                  'URLを発行する',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('連携する');
                },
                child: Text('連携する'),
              ),
              SizedBox(height: 20), // 追加でスペースを作る
              ElevatedButton(
                onPressed: () {
                  print('あとでするボタンが押されました');
                  // 'start.dart' の StartScreen に遷移
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => StartScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // 青いボタンにする
                ),
                child: Text(
                  'あとでする',
                  style: TextStyle(color: Colors.white), // 白い文字にする
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
