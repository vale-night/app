import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/app_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final bool isPassword;
  final bool isEmail;
  final ValueChanged<String> onChanged;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState(
      hintText: this.hintText,
      validator: this.validator,
      onSaved: this.onSaved,
      isEmail: this.isEmail,
      isPassword: this.isPassword,
      onChanged: this.onChanged);
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final String hintText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final bool isPassword;
  final bool isEmail;
  final ValueChanged<String> onChanged;

  _CustomTextFormFieldState(
      {required this.hintText,
      required this.validator,
      required this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
      required this.onChanged});

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(15.0),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: APP_PRIMARY_COLOR_HEX, width: 0.0)),
            border: const OutlineInputBorder(
                borderSide:
                    const BorderSide(color: APP_PRIMARY_COLOR_HEX, width: 0.0)),
            focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(
                    color: APP_PRIMARY_COLOR_HEX, width: 0.0))),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          widget.onChanged(value);
        },
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
