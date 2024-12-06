import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'kazoku.dart'; // 新しい画面のインポート

class UsernameScreen extends StatefulWidget {
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final _usernameController = TextEditingController();

  void _submitUsername() {
    final username = _usernameController.text;
    // ユーザー名を処理するロジックをここに追加
    print("入力されたユーザー名: $username");

    // 新しい画面に遷移
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextScreen(username: username), // ユーザー名を次の画面に渡す
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // 背景色を青に設定
      appBar: AppBar(title: Text('ユーザー名の入力')),
      body: Center( // 中央に配置
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // ボックスの色を白に設定
              borderRadius: BorderRadius.circular(16), // 角を丸くする
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'ユーザー名'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitUsername,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // ボタンの色を青に設定
                  ),
                  child: Text(
                    '次へ',
                    style: TextStyle(color: Colors.white), // 文字色を白に設定
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
