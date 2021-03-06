import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/config/themes/theme_config.dart';
import 'package:untitled/core/auth/choose-role/choose_role.dart';
import 'package:untitled/core/auth/login/login.dart';
import 'package:untitled/core/auth/organizer/register/register_organizer.dart';
import 'package:untitled/core/auth/register/register.dart';
import 'package:untitled/widgets/custom_app_bar.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValeNight',
      theme: ThemeConfig().materialTheme,
      home: MyHomePage(title: 'ValeNight'),
      routes: {
        '/choose_role': (context) => ChooseRolePage(),
        '/client/register': (context) => Register(),
        '/organizer/register': (context) => RegisterOrganizer(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 10),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Login()],
        ),
      ),
    );
  }
}
