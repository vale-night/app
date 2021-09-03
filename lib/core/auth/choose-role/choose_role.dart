import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/custom_app_bar.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({Key? key}) : super(key: key);

  @override
  _ChooseRolePageState createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), fixedSize: Size(300, 80));
  final TextStyle textStyle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você deseja...',
                style: textStyle,
              ),
              ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    navigateToClient();
                  },
                  child: Text('Encontrar festas e eventos')),
              Text(
                'Ou',
                style: textStyle,
              ),
              ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    navigateToOrganizer();
                  },
                  child: Text(
                    'Divulgar seus eventos?',
                    style: textStyle,
                  ))
            ],
          ),
        ));
  }

  navigateToClient() {
    Navigator.pushReplacementNamed(context, '/client/register');
  }

  navigateToOrganizer() {
    Navigator.pushReplacementNamed(context, '/organizer/register');
  }
}
