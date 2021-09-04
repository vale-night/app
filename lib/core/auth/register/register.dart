import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/custom_app_bar.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  var name = '';
  var email = '';
  var password = '';
  var passwordConfirmation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Crie sua conta',
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
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ao criar uma conta, você concorda com nossos termos de serviço e política de privacidade',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(178, 178, 178, 1),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              height: 75,
              child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  },
                  child: Text('CRIAR CONTA')),
            )
          ],
        ),
      ),
    );
  }
}
