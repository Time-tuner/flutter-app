import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              'images/cloud2.png',
              width: 250,
            ),
          ),
          Positioned(
            top: -50,
            left: -100,
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
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xff0092ac),
                    width: 3
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      child: SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                        child: const Text('1週間の予定',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                        onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                        child: const Text('推移',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                        onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                        child: const Text('安心Sleep',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                        onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                        child: const Text('ご飯通知設定',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                        onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                        child: const Text('設定',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                        onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: SizedBox(
                      width: 300,
                      height: 40,
                      child: OutlinedButton(
                        child: const Text('ヘルプ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                        onPressed: () {
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(padding: EdgeInsets.only(right: 50),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                        width: 115,
                        height: 30,
                        child: OutlinedButton(
                          child: const Text('ユーザ変更',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff0092ac)
                          ),
                          onPressed: () {
                            },
                          ),
                        ),
                      ),
                    )
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