import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/auth/organizer/register/basic_data.dart';
import 'package:untitled/core/auth/organizer/register/personal_data.dart';
import 'package:untitled/widgets/custom_app_bar.dart';

class RegisterOrganizer extends StatefulWidget {
  const RegisterOrganizer({Key? key}) : super(key: key);

  @override
  _RegisterOrganizerState createState() => _RegisterOrganizerState();
}

class _RegisterOrganizerState extends State<RegisterOrganizer> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
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
                steps: <Step>[
                  Step(
                    title: new Text('Dados do Promotor'),
                    content: Column(
                      children: <Widget>[BasicDataRegister()],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Address'),
                    content: Column(
                      children: <Widget>[PersonalDataRegister()],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Mobile Number'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
                controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(8.0),
                        height: 75,
                        child: ElevatedButton(
                            onPressed: () async {
                              onStepContinue?.call();
                            },
                            child: Text('AVANÇAR')),
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

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep < 2) setState(() => _currentStep += 1);
  }

  cancel() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }
}
