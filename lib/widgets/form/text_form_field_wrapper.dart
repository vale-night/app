import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWrapper extends StatefulWidget {
  final TextFormField textFormField;

  TextFormFieldWrapper({
    Key? key,
    required this.textFormField,
  }) : super(key: key);

  @override
  _TextFormFieldWrapperState createState() =>
      _TextFormFieldWrapperState(textFormField: this.textFormField);
}

class _TextFormFieldWrapperState extends State<TextFormFieldWrapper> {
  final TextFormField textFormField;

  _TextFormFieldWrapperState({required this.textFormField});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0), child: this.textFormField);
  }
}
