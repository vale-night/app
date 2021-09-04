import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/organizer.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

class AddressRegister extends StatefulWidget {
  final Organizer organizer;
  const AddressRegister({Key? key, required this.organizer}) : super(key: key);

  @override
  _AddressRegisterState createState() =>
      _AddressRegisterState(organizer: this.organizer);
}

class _AddressRegisterState extends State<AddressRegister> {
  final Organizer organizer;
  final _formKey = GlobalKey<FormState>();
  var cep;
  var street;
  var number;
  var neighborhood;
  var city;
  var uf;
  var country;

  _AddressRegisterState({required this.organizer});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Endereço - Organizador',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'CEP',
              ),
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.cep = newValue,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Rua',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => this.street = newValue,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nº',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => this.number = newValue,
                  ),
                ),
              ),
            ],
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'Bairro',
              ),
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.neighborhood = newValue,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Cidade',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => this.city = newValue,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormFieldWrapper(
                  textFormField: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'UF',
                    ),
                    validator: (value) => ('true'),
                    onSaved: (newValue) => (true),
                    onChanged: (newValue) => this.uf = newValue,
                  ),
                ),
              )
            ],
          ),
          TextFormFieldWrapper(
            textFormField: TextFormField(
              decoration: InputDecoration(
                hintText: 'País',
              ),
              validator: (value) => ('true'),
              onSaved: (newValue) => (true),
              onChanged: (newValue) => this.country = newValue,
            ),
          ),
        ],
      ),
    );
  }
}
