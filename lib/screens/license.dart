import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class licensePage extends StatefulWidget {
  const licensePage({Key? key}) : super(key: key);


  @override
  State<licensePage> createState() => _licensePageState();
}

class _licensePageState extends State<licensePage> {
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
                      child: Text("利用規約",
                          style: TextStyle(fontSize: 25),
                        ),
                    ),
                    SizedBox(height: 40,),

                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            width: 320,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 320,
                                    child: Column(
                                      children: [
                                        Text(''' 作成したらここに張り付け''',
                                          style: TextStyle(
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
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