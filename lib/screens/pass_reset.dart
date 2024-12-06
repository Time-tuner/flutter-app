import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PassResetPage extends StatefulWidget {
  const PassResetPage({Key? key}) : super(key: key);


  @override
  State<PassResetPage> createState() => _PassResetPageState();
}

class _PassResetPageState extends State<PassResetPage> {
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
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child:Image.asset(
                "images/ground3.png"
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child:Image.asset(
                "images/leaf.png"
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 50,
                    top: 50,
                    child: Text(
                      "Timetuner",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    top: -50,
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
                      SizedBox(height: 150),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'パスワードのリセット',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 400,
                        child: Text(
                          '次回から、変更したパスワードでログインできます。',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: Text(
                          '新しいパスワードは必ずお控えください。',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 400,
                child: Text(
                  "新しいパスワード",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 400,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,

                  ),
                ),
              ),
              Container(
                width: 400,
                child: Text(
                  "半角英数と記号を含む６文字以上",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 400,
                child: Text(
                  "新しいパスワードの確認",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 400,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,

                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  child: const Text('再設定'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    textStyle: TextStyle(fontSize: 13)
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}