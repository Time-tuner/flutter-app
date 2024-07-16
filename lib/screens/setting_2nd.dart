import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Setting_2ndPage extends StatefulWidget {
  const Setting_2ndPage({Key? key}) : super(key: key);


  @override
  State<Setting_2ndPage> createState() => _Setting_2ndPageState();
}

class _Setting_2ndPageState extends State<Setting_2ndPage> {
  bool _isObscure = true;
  late FixedExtentScrollController _fixedExtentScrollController;
  int currentIndex = 0;
  final list = ['aaaa', 'bbb', 'ccc', 'ddd'];

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 400),
    ));
  }

  @override
  void initState() {
    _fixedExtentScrollController = FixedExtentScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0092ac),
      body: Stack(
        children: [
          Positioned(
            left: 240,
            child: Image.asset(
              'images/leaf2.png',
              width: 300,
              height:200,
            ),
          ),
          Positioned(
            top: 570,
            left: -50,
            child: Image.asset(
              'images/leaf.png',
              width: 400,
              height:400,
            ),
          ),
          Positioned(
            top: 740,
            left: 290,
            child: Image.asset(
              'images/cloud2.png',
              width: 250,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80),
              Container(
                alignment: Alignment.center,
                child:Text(
                  '○○のTimetuner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xff0092ac),
                    width: 2
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 350,
                      child: TextButton(
                        child: Text("＜戻る",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("ユーザ設定",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("言語",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("利用規約",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("プライバシーポリシー",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("ライセンス表記",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("よくある質問",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      child: TextButton(
                        child: Text("お問い合わせ",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
  int _getCurrentIndex() {
    int index = _fixedExtentScrollController.selectedItem % list.length;
    return index;
  }
}