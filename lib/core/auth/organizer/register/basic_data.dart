import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

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
            style: Theme.of(context).textTheme.headline1,
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Nome completo',
              ),
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.name = newValue,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.email = newValue,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Senha',
              ),
              obscureText: true,
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.password = newValue,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirmar Senha',
              ),
              obscureText: true,
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.passwordConfirmation = newValue,
            ),
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
