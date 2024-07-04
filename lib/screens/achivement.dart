import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AchivementPage extends StatefulWidget {
  const AchivementPage({Key? key}) : super(key: key);


  @override
  State<AchivementPage> createState() => _AchivementPageState();
}

class _AchivementPageState extends State<AchivementPage> {
  bool _isObscure = true;
  String? isSelectedItem = '絞り込み';
  

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
            left: 300,
            top: -40,
            child: Image.asset(
              'images/cloud1.png',
              width: 200,
              height: 200,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 400,
              height: 600,
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 222, 221, 221),
                    surfaceTintColor: Colors.amber,
                    bottom: TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Color(0xff0092ac),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: "ミッション"),
                        Tab(text: "達成済み"),
                        Tab(text: "ボーナス"),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      //ミッションタブここから
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Container(
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0092ac),
                                    width: 2
                                  )
                                )
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/gold.png"),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/silver.png"),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/bronse.png"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: 10,right: 20),
                              child: SizedBox(
                              width: 105,
                              height: 30,
                              child: OutlinedButton(
                                child: const Text('一括受取',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  shape: const StadiumBorder(),
                                  side: const BorderSide(color: Color(0xff0092ac)),
                                ),
                                onPressed: () {},
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 350,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0092ac),
                                    width: 2
                                  )
                                )
                              ),
                              child: SizedBox(
                                width: 50,
                                child: Image.asset("images/gold.png"),
                              )
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 350,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0092ac),
                                    width: 2
                                  )
                                )
                              ),
                              child: SizedBox(
                                width: 50,
                                child: Image.asset("images/silver.png"),
                              )
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 350,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0092ac),
                                    width: 2
                                  )
                                )
                              ),
                              child: SizedBox(
                                width: 50,
                                child: Image.asset("images/bronse.png"),
                              )
                            )
                          ],
                        ),
                      ),
                      //ミッションタブここまで
                      //達成済みタブここから
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                            ),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff0092ac)
                                    )
                                  ),
                                  child: Padding(padding: EdgeInsets.only(),
                                    child: DropdownButton(
                                    //4
                                      items: const [
                                        //5
                                        DropdownMenuItem(
                                          child: Text('絞り込み'),
                                          value: '絞り込み',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('bbb'),
                                          value: 'bbb',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('ccc'),
                                          value: 'ccc',
                                        ),
                                      ],
                                      //6
                                      onChanged: (String? value) {
                                        setState(() {
                                          isSelectedItem = value;
                                        });
                                      },
                                      //7
                                      value: isSelectedItem,
                                    ),
                                  ),
                                ) 
                              ],
                            ),
                            SizedBox(height: 50,),
                            Container(
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0092ac),
                                    width: 2
                                  )
                                )
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/gold.png"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Text("1",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/silver.png"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                      child: Text("2",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/bronse.png"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                      child: Text("3",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //達成済みタブここまで
                      //ボーナスタブここから
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                            ),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff0092ac)
                                    )
                                  ),
                                  child: Padding(padding: EdgeInsets.only(),
                                    child: DropdownButton(
                                    //4
                                      items: const [
                                        //5
                                        DropdownMenuItem(
                                          child: Text('絞り込み'),
                                          value: '絞り込み',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('bbb'),
                                          value: 'bbb',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('ccc'),
                                          value: 'ccc',
                                        ),
                                      ],
                                      //6
                                      onChanged: (String? value) {
                                        setState(() {
                                          isSelectedItem = value;
                                        });
                                      },
                                      //7
                                      value: isSelectedItem,
                                    ),
                                  ),
                                ) 
                              ],
                            ),
                            SizedBox(height: 50,),
                            Container(
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0092ac),
                                    width: 2
                                  )
                                )
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/gold.png"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Text("1",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/silver.png"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                      child: Text("2",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Image.asset("images/bronse.png"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                      child: Text("3",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: 10,right: 20),
                              child: SizedBox(
                                width: 105,
                                height: 30,
                                child: OutlinedButton(
                                  child: const Text('一括受取',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    shape: const StadiumBorder(),
                                    side: const BorderSide(color: Color(0xff0092ac)),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)
                                          ),
                                          child:  Container(
                                            width: 350,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Color(0xff0092ac),width: 3),
                                              borderRadius: BorderRadius.circular(20.0)
                                              
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment: Alignment.centerRight,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 10,right: 10),
                                                    child: Image.asset("images/star1.png"),
                                                    )
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 50,
                                                      child: Image.asset("images/gold.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                      child: Text("1",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                      child: Image.asset("images/silver.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                        child: Text("2",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold
                                                        )
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                      child: Image.asset("images/bronse.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                      child: Text("3",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold
                                                        )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 10,left: 10),
                                                    child: Image.asset("images/star2.png"),
                                                    )
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    child: Text("ゲット！",
                                                      style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 20,)
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                      ),
                      //ボーナスタブここまで
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      ),
   );
  }
}