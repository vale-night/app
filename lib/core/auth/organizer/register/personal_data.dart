import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/form/custom_date_form_field.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

class PersonalDataRegister extends StatefulWidget {
  const PersonalDataRegister({Key? key}) : super(key: key);

  @override
  _PersonalDataRegisterState createState() => _PersonalDataRegisterState();
}

class _PersonalDataRegisterState extends State<PersonalDataRegister> {
  final _formKey = GlobalKey<FormState>();
  var cpf = '';
  var rg = '';
  var password = '';
  var passwordConfirmation = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      child: Column(
        children: [
          Text('Dados Pessoais - Organizador',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'CPF',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => this.cpf = newValue,
                  ),
                ),
                TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'RG',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => this.rg = newValue,
                  ),
                ),
                CustomDateFormField(
                  hintText: 'Data de Nascimento',
                  validator: (value) => ('true'),
                  onSaved: (newValue) => (true),
                  onChanged: (newValue) => this.password = newValue,
                ),
              ],
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
