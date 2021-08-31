import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/core/auth/login/login.dart';
import 'package:untitled/core/auth/register/register.dart';
import 'package:untitled/utils/helpers/create_material_color.dart';
import 'package:untitled/widgets/custom_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValeNight',
      theme: ThemeData(
        primarySwatch: CreateMaterialColor().createMaterialColor(APP_PRIMARY_COLOR_HEX),
      ),
      home: MyHomePage(title: 'ValeNight'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 10
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Register()],
        ),
      ),
    );
  }
}
