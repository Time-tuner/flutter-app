import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart';
import 'package:time_tuner/widgets/humburgermenu_widget.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  runApp(drawer());
}

class drawer extends StatefulWidget {
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time tuner',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({
    super.key,
  });

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
@override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      //カスタムWidgetを呼び出す
      drawer: HumburgermenuWidget(),
    );
  }
}