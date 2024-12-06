import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModeSetPage extends StatefulWidget {
  const ModeSetPage({Key? key}) : super(key: key);


  @override
  State<ModeSetPage> createState() => _ModeSetPageState();
}

enum RadioValue { FIRST, SECOND, THIRD }

class _ModeSetPageState extends State<ModeSetPage> {
  bool _isObscure = true;
  RadioValue _gValue = RadioValue.FIRST;

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
            child:Positioned(
              left: 150,
              top: 580,
              child:Image.asset(
                "images/leaf.png"
              ),
            )
          ),
          Container(
            child: Positioned(
              left: -50,
              top: 740,
              child: Image.asset(
                'images/cloud2.png',
                width: 300,
                height:200,
              ),
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 150),
                      
                      SizedBox(height: 20),
                      Container(
                        width: 450,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        ),
                        child:Center(
                          child: Column(
                          children: [
                            SizedBox(height: 30),
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
                              child: Text(
                                "デフォルトモード",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 80)),
                                TextButton.icon(
                                  label: Text('勉強',),
                                  icon: Icon(Icons.article_outlined),
                                  onPressed: () {
                                    //ボタンタップ時の処理
                                  },
                                  style: TextButton.styleFrom(
                                    iconColor: Colors.grey,
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    )
                                  ),
                                ),
                              ],
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
                              child: Text(
                                "カスタマイズモード",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 80)),
                                TextButton.icon(
                                  label: Text('遊び',),
                                  icon: Icon(Icons.article_outlined),
                                  onPressed: () {
                                    //ボタンタップ時の処理
                                  },
                                  style: TextButton.styleFrom(
                                    iconColor: Colors.grey,
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    )
                                  ),
                                ),
                                SizedBox(height: 30,),
                                TextButton.icon(
                                  label: Text('ゲーム',),
                                  icon: Icon(Icons.article_outlined),
                                  onPressed: () {
                                    //ボタンタップ時の処理
                                  },
                                  style: TextButton.styleFrom(
                                    iconColor: Colors.grey,
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    )
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton.filled(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    // ボタンタップ時の処理
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor: Color(0xff0092ac),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        
                        ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  _onRadioSelected(value) {
    setState(() {
      _gValue = value;
    });

  }
}