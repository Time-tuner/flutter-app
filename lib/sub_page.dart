import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:time_tuner/main.dart';
//import 'package:time_tuner/sub_page.dart';


void sub() async {
WidgetsFlutterBinding.ensureInitialized();
  runApp(drawer2());
}

class drawer2 extends StatefulWidget {
  State<drawer2> createState() => _drawerState();
}

class _drawerState extends State<drawer2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time tuner',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: subpage(),
    );
  }
}

class subpage extends StatelessWidget {
  subpage({
    super.key,
  });

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
@override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Time tuner2'),
      ),
      drawer: Drawer(
        elevation: 16.0,
        backgroundColor: Color.fromARGB(255, 193, 249, 227),
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                child: Text('Time tuner', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                margin: (EdgeInsets.only(left: 30, top: 100, right: 0, bottom: 15)),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('ホーム'),
                tileColor: Color.fromRGBO(183, 237, 181, 1),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),                
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text('カレンダー'),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart_outlined),
                title: Text('推移'),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.accessibility_new_rounded),
                title: Text('実績'),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.ad_units),
                title: Text('モード設定'),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 140,
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('ヘルプ'),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>subpage(),));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('設定'),
                contentPadding: EdgeInsets.only(left: 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                splashColor: Color.fromRGBO(196, 221, 195, 1),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>subpage(),)
                  );
                },
              ),
            ]
          )
        )
      )
    );
  }
}