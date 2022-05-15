import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/feature/signin_signup/bloc/step_five/bloc_step_five.dart';

class FormStepFive extends StatefulWidget {
  @override
  _FormStepFiveState createState() => _FormStepFiveState();
}

class _FormStepFiveState extends State<FormStepFive> {
  TextEditingController pinPutController = TextEditingController();
  FocusNode pinPutFocusNode = FocusNode();
  String errorCode;

  BoxDecoration createBox() {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Color(0xFFF0F0F0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, bottom: 16),
      child: BlocBuilder<StepFiveBloc, StepFiveState>(
        bloc: BlocProvider.of<StepFiveBloc>(context),
        builder: (context, state) {
          if (state is StepFiveFailure) {
            errorCode = state.errorCode;
          } else {
            errorCode = null;
          }
          return Column(
            children: [
              SizedBox(
                height: 55,
                child: PinPut(
                  fieldsCount: 6,
                  onChanged: (pin) {
                    BlocProvider.of<StepFiveBloc>(context)
                        .add(StepFiveButtonPressed(codeVerity: pin));
                  },
                  pinAnimationType: PinAnimationType.slide,
                  focusNode: pinPutFocusNode,
                  controller: pinPutController,
                  textStyle: AppWidget.boldTextFieldStyle(
                      color: const Color(0xFF020433),
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      height: 43.88),
                  submittedFieldDecoration: createBox(),
                  selectedFieldDecoration: createBox(),
                  followingFieldDecoration: createBox(),
                ),
              ),
              errorCode != null
                  ? AppWidget.textErrorStyle(textError: errorCode)
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
