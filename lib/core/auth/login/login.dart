import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/form/CustomTextFormField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              hintText: 'Email',
              validator: (value) => ('true'),
              onSaved: (newValue) => (true)),
          CustomTextFormField(
              hintText: 'Senha',
              validator: (value) => ('true'),
              onSaved: (newValue) => (true)),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              },
              child: Text('ENTRAR'))
        ],
      ),
    );
  }
}
