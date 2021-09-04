import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/core/auth/choose-role/choose_role.dart';
import 'package:untitled/utils/services/valenight/valenight_auth_api_service.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

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
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(hintText: 'Email'),
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.email = newValue,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(hintText: 'Senha'),
              obscureText: true,
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.password = newValue,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            height: 75,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                },
                child: Text('Login com facebook')),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            height: 75,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(APP_SECONDARY_COLOR_HEX)),
                onPressed: () {
                  this.navigateToChooseRole();
                },
                child: Text('Cadastre-se')),
          ),
          Text('ou'),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            height: 75,
            child: ElevatedButton(
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
          ),
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
    var result = await ValeNightAuthService.login(this.email, this.password);
    return result;
  }
}
