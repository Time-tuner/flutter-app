import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DinnerTimePage extends StatefulWidget {
  const DinnerTimePage({Key? key}) : super(key: key);


  @override
  State<DinnerTimePage> createState() => _DinnerTimePageState();
}

class _DinnerTimePageState extends State<DinnerTimePage> {
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
                    SizedBox(height: 50,),
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
                        "ご飯通知設定",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      )
                    ),
                    SizedBox(height: 70),
                    Text(
                      "送信される内容",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 70),
                    Text(
                      "15分後ご飯ができるよ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 70),
                    Container(
                      child: SizedBox(
                      width: 105,
                      height: 30,
                      child: OutlinedButton(
                        child: const Text('変更',
                        textAlign: TextAlign.center,
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff0092ac),
                          shape: const StadiumBorder()
                        ),
                        onPressed: () {
                          onNotification: (ScrollNotification scrollnotification) {
                            /// スクロールされた際に選択している値が変わっていたら振動させる
                            if (currentIndex != _getCurrentIndex()) {
                              currentIndex = _getCurrentIndex();
                              HapticFeedback.mediumImpact();
                            }
                            return true;
                          };
                          /// ドラムロールUI
                          child: ListWheelScrollView.useDelegate(
                            controller: _fixedExtentScrollController,
                            itemExtent: 56,
                            physics: FixedExtentScrollPhysics(),
                            diameterRatio: 1.7,
                            squeeze: 0.9,
                            /// 無限スクロールできるようにする
                            childDelegate: ListWheelChildLoopingListDelegate(
                              children: list
                                  .map((String selectItem) => Container(
                                        width: double.infinity,
                                        height: 56,
                                        child: Center(
                                          child: Text(selectItem),
                                        ),
                                      ))
                                  .toList(),
                              ),
                            );
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
  int _getCurrentIndex() {
    int index = _fixedExtentScrollController.selectedItem % list.length;
    return index;
  }
}