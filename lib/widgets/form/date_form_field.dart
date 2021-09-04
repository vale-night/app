import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:untitled/widgets/form/text_form_field_wrapper.dart';

class DateFormField extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;

  const DateFormField(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.onSaved,
      required this.onChanged})
      : super(key: key);

  @override
  _DateFormFieldState createState() => _DateFormFieldState(
      this.hintText, this.validator, this.onSaved, this.onChanged);
}

class _DateFormFieldState extends State<DateFormField> {
  DateTime selectedDate = DateTime.now();
  var dateFormat;
  final maskFormatter = new MaskTextInputFormatter(mask: '##/##/####');
  final textEditingController = new TextEditingController();
  final String hintText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;

  _DateFormFieldState(
      this.hintText, this.validator, this.onSaved, this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormFieldWrapper(
        textFormField: TextFormField(
          decoration: InputDecoration(
              hintText: this.hintText,
              suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: IconButton(
                    onPressed: () {
                      openDatePicker(context);
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      size: 36,
                    ),
                  ) // myIcon is a 48px-wide widget.
                  )),
          onTap: () {
            // openDatePicker(context);
          },
          validator: this.validator,
          onChanged: this.onChanged,
          onSaved: this.onSaved,
          controller: textEditingController,
          inputFormatters: [maskFormatter],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting()
        .then((value) => {this.dateFormat = new DateFormat('dd/MM/yyyy')});
  }

  openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200));
    if (picked != null) {
      String formattedDate = dateFormat.format(picked.toUtc());
      setState(() {
        selectedDate = picked;
      });
      this.textEditingController.text = formattedDate;
      print(picked);
      print(formattedDate);
    }
    // widget.onChanged(picked);
  }
}
