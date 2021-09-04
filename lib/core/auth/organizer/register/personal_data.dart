import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/widgets/form/date_form_field.dart';
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
                    inputFormatters: [CPF_MASK],
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
                DateFormField(
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
              child: Column(
                children: [
                  IconButton(
                      iconSize: 100,
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                      ),
                      onPressed: () {
                        //TODO - Implementar upload de foto
                        print('TODO - Implementar upload de foto');
                      }),
                  Text(
                    'Clique para nos enviar uma foto sua!',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
