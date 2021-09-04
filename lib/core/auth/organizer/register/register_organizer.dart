import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/auth/organizer/register/address.dart';
import 'package:untitled/core/auth/organizer/register/basic_data.dart';
import 'package:untitled/core/auth/organizer/register/company_data.dart';
import 'package:untitled/core/auth/organizer/register/personal_data.dart';
import 'package:untitled/models/organizer.dart';
import 'package:untitled/utils/services/valenight/valenight_organizer_api_service.dart';
import 'package:untitled/widgets/custom_app_bar.dart';

class RegisterOrganizer extends StatefulWidget {
  const RegisterOrganizer({Key? key}) : super(key: key);

  @override
  _RegisterOrganizerState createState() => _RegisterOrganizerState();
}

class _RegisterOrganizerState extends State<RegisterOrganizer> {
  final _formKey = GlobalKey<FormState>();

  final Organizer organizer = Organizer.empty();

  int _currentStep = 0;
  int stepsCount = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    final steps = [
      Step(
        title: new Text('Dados de login'),
        content: Column(
          children: <Widget>[BasicDataRegister(organizer: this.organizer)],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: new Text('Dados pessoais'),
        content: Column(
          children: <Widget>[PersonalDataRegister(organizer: this.organizer)],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: new Text('Dados empresariais'),
        content: Column(
          children: <Widget>[CompanyDataRegister(organizer: this.organizer)],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: new Text('Dados de Endereço'),
        content: Column(
          children: <Widget>[
            AddressRegister(organizer: this.organizer),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
    ];

    stepsCount = steps.length;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: steps,
                controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8.0),
                        height: 75,
                        child: ElevatedButton(
                            onPressed: () async {
                              saveOrganizer().then((result) =>
                                  ((result) ? onStepContinue?.call() : null));
                            },
                            child: Text(isLastStep() ? 'SALVAR' : 'AVANÇAR')),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> saveOrganizer() async {
    print(jsonEncode(this.organizer.toJson()));
    final result = await ValeNightOrganizerService.save(this.organizer);
    if (result!.id != null) {
      this.organizer.id = result.id;
      this.organizer.user.id = result.user.id;
      print(this.organizer.user.id);
      return true;
    }
    return false;
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  isLastStep() {
    return _currentStep == (stepsCount - 1);
  }

  continued() {
    if (_currentStep < (stepsCount - 1)) setState(() => _currentStep += 1);
  }

  cancel() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }
}
