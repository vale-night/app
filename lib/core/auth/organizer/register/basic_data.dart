import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/widgets/form/custom_text_form_field.dart';

class BasicDataRegister extends StatefulWidget {
  const BasicDataRegister({Key? key}) : super(key: key);

  @override
  _BasicDataRegisterState createState() => _BasicDataRegisterState();
}

class _BasicDataRegisterState extends State<BasicDataRegister> {
  final _formKey = GlobalKey<FormState>();
  var name = '';
  var email = '';
  var password = '';
  var passwordConfirmation = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Crie sua conta - Organizador',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: APP_PRIMARY_COLOR_HEX,
              fontSize: 30,
            ),
          ),
          CustomTextFormField(
            hintText: 'Nome completo',
            validator: (value) => ('true'),
            onSaved: (newValue) => (true),
            onChanged: (newValue) => this.name = newValue,
          ),
          CustomTextFormField(
            hintText: 'Email',
            validator: (value) => ('true'),
            onSaved: (newValue) => (true),
            onChanged: (newValue) => this.email = newValue,
          ),
          CustomTextFormField(
            hintText: 'Senha',
            validator: (value) => ('true'),
            onSaved: (newValue) => (true),
            onChanged: (newValue) => this.password = newValue,
          ),
          CustomTextFormField(
            hintText: 'Confirmar Senha',
            validator: (value) => ('true'),
            onSaved: (newValue) => (true),
            onChanged: (newValue) => this.passwordConfirmation = newValue,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ao criar uma conta, você concorda com nossos termos de serviço e política de privacidade',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(178, 178, 178, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
