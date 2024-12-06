import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);


  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
            top:-30,
            left: 260,
            child: Image.asset(
              'images/cloud2.png',
              width: 300,
            ),
          ),
          Positioned(
            top: 730,
            left: -50,
            child: Image.asset(
              'images/cloud2.png',
              width: 300,
            ),
          ),
          Positioned(
            top: 500,
            left: 230,
            child: Image.asset(
              'images/cloud2.png',
              width: 300,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80),
              Container(
                alignment: Alignment.center,
              ),
              SizedBox(height: 50),
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
                      width: 340,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      padding: EdgeInsets.only(left: 20),
                      child: Text("お問い合わせ",
                          style: TextStyle(fontSize: 25),
                        ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(width: 300,
                      child: Text("メールアドレス",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Container(width: 300,height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff0092ac),
                          width: 2
                        )
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(width: 300,
                      child: Text("件名",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Container(width: 300,height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff0092ac),
                          width: 2
                        )
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(width: 300,
                      child: Text("お問い合わせ内容",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    Container(width: 300,height: 120,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff0092ac),
                          width: 2
                        )
                      ),
                    ),
                    SizedBox(height: 30),
                    OutlinedButton(
                      child: const Text('送信',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(color: Color(0xff0092ac)),
                      ),
                      onPressed: () {},
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