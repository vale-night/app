import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/organizer.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

class BasicDataRegister extends StatefulWidget {
  final Organizer organizer;
  const BasicDataRegister({Key? key, required this.organizer})
      : super(key: key);

  @override
  _BasicDataRegisterState createState() =>
      _BasicDataRegisterState(organizer: this.organizer);
}

class _BasicDataRegisterState extends State<BasicDataRegister> {
  final _formKey = GlobalKey<FormState>();
  final Organizer organizer;

  _BasicDataRegisterState({required this.organizer});

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
              onSaved: (newValue) => (organizer.name = newValue!),
              onChanged: (newValue) => organizer.name = newValue,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) => ('true'),
              onSaved: (newValue) => (organizer.user.email = newValue!),
              onChanged: (newValue) => organizer.user.email = newValue,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Senha',
              ),
              obscureText: true,
              validator: (value) => ('true'),
              onSaved: (newValue) => (organizer.user.password = newValue!),
              onChanged: (newValue) => organizer.user.password = newValue,
            ),
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirmar Senha',
              ),
              obscureText: true,
              validator: (value) => ('true'),
              onSaved: (newValue) =>
                  (organizer.user.passwordConfirmation = newValue!),
              onChanged: (newValue) =>
                  organizer.user.passwordConfirmation = newValue,
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
