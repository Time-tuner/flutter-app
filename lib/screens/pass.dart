import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PassPage extends StatefulWidget {
  const PassPage({Key? key}) : super(key: key);


  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
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
                "images/ground2.png"
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
                    left: -50,
                    top: -50,
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
                      SizedBox(height: 150),
                      Text(
                        'Timetuner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: Text(
                  "メールアドレス",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 300,
                height: 50,
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
                height: 30,
                child: ElevatedButton(
                  child: const Text('送信'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    textStyle: TextStyle(fontSize: 13,),
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