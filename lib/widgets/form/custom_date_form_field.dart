import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/form/custom_text_form_Field.dart';

class CustomDateFormField extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;

  const CustomDateFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.onSaved,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomDateFormFieldState createState() => _CustomDateFormFieldState(
      this.hintText, this.validator, this.onSaved, this.onChanged);
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  final String hintText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;

  _CustomDateFormFieldState(
      this.hintText, this.validator, this.onSaved, this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        hintText: this.hintText,
        validator: this.validator,
        onChanged: this.onChanged,
        onSaved: this.onSaved,
        onFocusChange: () {
          onFocusChange(context);
        },
      ),
    );
  }

  onFocusChange(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2200));
  }
}
