import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OyaStartPage extends StatefulWidget {
  const OyaStartPage({Key? key}) : super(key: key);


  @override
  State<OyaStartPage> createState() => _OyaStartPageState();
}

enum RadioValue { FIRST, SECOND, THIRD }

class _OyaStartPageState extends State<OyaStartPage> {
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
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 150),
                      SizedBox(
                        width: 400,
                        child: Text(
                          '家族のTimeTunerを見る',
                          textAlign: TextAlign.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.only(left:120),
                              child: RadioListTile(
                                title: Text('選択肢 1'),
                                value: RadioValue.FIRST,
                                groupValue: _gValue,
                                onChanged: (value) => _onRadioSelected(value),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 120),
                              child: RadioListTile(
                                title: Text('選択肢 2'),
                                value: RadioValue.SECOND,
                                groupValue: _gValue,
                                onChanged: (value) => _onRadioSelected(value),
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 120),
                              child: RadioListTile(
                                title: Text('選択肢 3'),
                                value: RadioValue.THIRD,
                                groupValue: _gValue,
                                onChanged: (value) => _onRadioSelected(value),
                              )
                            ),
                            SizedBox(height: 15,),
                            Container(
                              child: SizedBox(
                              width: 105,
                              height: 30,
                              child: OutlinedButton(
                                child: const Text('始める',
                                textAlign: TextAlign.center,
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xff0092ac),
                                  shape: const StadiumBorder()
                                ),
                                onPressed: () {

                                }
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Container(
                              child: SizedBox(
                              child: OutlinedButton(
                                child: const Text('全体にご飯通知を通知する',
                                textAlign: TextAlign.center,
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xff0092ac),
                                  shape: const StadiumBorder()
                                ),
                                onPressed: () {

                                }
                                ),
                              ),
                            ),
                            SizedBox(height: 30)
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