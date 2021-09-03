import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/auth/choose-role/choose_role.dart';
import 'package:untitled/core/auth/register/register.dart';
import 'package:untitled/utils/services/valenight_api_service.dart';
import 'package:untitled/widgets/form/CustomTextFormField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            isEmail: true,
            validator: (value) => ('true'),
            onSaved: (newValue) => (true),
            onChanged: (newValue) => this.email = newValue,
          ),
          CustomTextFormField(
            hintText: 'Senha',
            isPassword: true,
            validator: (value) => ('true'),
            onSaved: (newValue) => (true),
            onChanged: (newValue) => this.password = newValue,
          ),
          ElevatedButton(
              onPressed: () async {
                login().then((value) => {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(value
                                ? 'Usuário autenticado'
                                : 'Ocorreu um erro')),
                      )
                    });
              },
              child: Text('ENTRAR')),
          Text('ou'),
          ElevatedButton(
              onPressed: () {
                this.navigateToChooseRole();
              },
              child: Text('CRIAR CONTA'))
        ],
      ),
    );
  }

  navigateToChooseRole() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseRolePage()),
    );
  }

  Future<bool> login() async {
    var result = await ValeNightApiService.login(this.email, this.password);
    return result;
  }
}
