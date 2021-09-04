import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/models/organizer.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

class CompanyDataRegister extends StatefulWidget {
  final Organizer organizer;
  const CompanyDataRegister({Key? key, required this.organizer})
      : super(key: key);

  @override
  _CompanyDataRegisterState createState() =>
      _CompanyDataRegisterState(organizer: this.organizer);
}

class _CompanyDataRegisterState extends State<CompanyDataRegister> {
  final Organizer organizer;
  final _formKey = GlobalKey<FormState>();

  _CompanyDataRegisterState({required this.organizer});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      child: Column(
        children: [
          Text('Dados Empresariais - Organizador',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'CNPJ',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => organizer.cnpj = newValue,
                    inputFormatters: [CNPJ_MASK],
                  ),
                ),
                TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nome Fantasia',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => organizer.fantasyName = newValue,
                  ),
                ),
                TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Razão Social',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => organizer.socialReason = newValue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
