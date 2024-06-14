import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 400),
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0092ac),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(
                    left: -50,
                    top: -40,
                    child: Image.asset(
                      'images/cloud1.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    left: 300,
                    top: 0,
                    child: Image.asset(
                      'images/cloud1.png',
                      width: 300,
                      height:200,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 100),
                      Text(
                        'Timetuner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("images/google_logo.png"),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Googleでログイン',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    //ボタンが押されたときの処理
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white, backgroundColor: Color(0xFF4cc764),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){
                              //ボタンが押されたときの処理
                            },
                          child: Image.asset(
                        'images/line_logo.png', // Lineのロゴ画像をassetsフォルダに追加してください
                        fit: BoxFit.contain,
                      ),
                          ),
                        ),
                      ),
                     
                      SizedBox(width: 30),
                      Text(
                        'Lineでログイン',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      ClipRRect(
                        child: Image.asset(
                          "images/mail_logo.png",
                          width:40,
                          height:30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'メールアドレスでログイン',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    child: Image.asset(
                          "images/ground2.png",
                          width: 600,
                    )
                  ),
                  Column(
                    children: [
                      SizedBox(height: 50),
                      Center(
                        child:Text(
                          'パスワードを忘れた場合はこちら',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child:Text(
                          '新規登録の方はこちら',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50), // 下部のスペース
            ],
          ),
        ),
      ),
    );
  }
}
