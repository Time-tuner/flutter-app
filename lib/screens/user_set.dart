import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class UserSetPage extends StatefulWidget {
  const UserSetPage({Key? key}) : super(key: key);


  @override
  State<UserSetPage> createState() => _UserSetPageState();
}

class _UserSetPageState extends State<UserSetPage> {
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
              'images/cloud1.png',
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
                height: 500,
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
                      child: Text(
                        "ユーザ設定",
                        style: TextStyle(
                          fontSize: 25
                        ),
                      )
                    ), 
                    SizedBox(height: 70),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("ユーザ名"),
                              Container(
                                width: 170,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xff0092ac),
                                      width: 2
                                    )
                                  )
                                ),
                                //text
                              ),
                            ],
                          ),
                          SizedBox(height: 70),
                          Container(
                            child: Text("連携済みアカウント一覧"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 70),
                    Container(
                      child: SizedBox(
                        width: 105,
                        height: 30,
                        child: OutlinedButton(
                          child: const Text('編集する',
                          textAlign: TextAlign.center,
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff0092ac),
                            shape: const StadiumBorder()
                          ),
                          onPressed: () {
                            
                          },
                        ),
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
}