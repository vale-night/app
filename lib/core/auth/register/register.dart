import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/widgets/form/CustomTextFormField.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('Crie sua conta',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: APP_PRIMARY_COLOR_HEX,
              fontSize: 30,
            ),
          ),
          CustomTextFormField(
              hintText: 'Nome completo',
              validator: (value) => ('true'),
              onSaved: (newValue) => (true)),
          CustomTextFormField(
              hintText: 'Email',
              validator: (value) => ('true'),
              onSaved: (newValue) => (true)),
          CustomTextFormField(
              hintText: 'Senha',
              validator: (value) => ('true'),
              onSaved: (newValue) => (true)),
          CustomTextFormField(
              hintText: 'Confirmar Senha',
              validator: (value) => ('true'),
              onSaved: (newValue) => (true)),
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
            child:
              Text(

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
    );
  }
}
