import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/log_in_widget.dart';

import 'form/form_step_five.dart';

class SetUpStepFive extends StatelessWidget {
  const SetUpStepFive({this.switchStep});
  final Function(int) switchStep;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 16),
                    child: LogInWidget.createTextWidget(
                        input: 'Verification Code',
                        color: const Color(0xFF020433)),
                  ),
                  Text(
                    'We texted you an access code.',
                    style: AppWidget.simpleTextFieldStyle(
                        color: const Color(0xFF020433),
                        fontSize: 14,
                        height: 24),
                  ),
                  Text(
                    'Please enter it below',
                    style: AppWidget.simpleTextFieldStyle(
                        color: const Color(0xFF020433),
                        fontSize: 14,
                        height: 24),
                  ),
                ],
              ),
              Column(
                children: [
                  FormStepFive(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'This help us authenticate every user on Roomy,',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF404B69),
                              height: 21,
                              fontSize: 12),
                        ),
                        Text(
                          'for your peace of mind.',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF404B69),
                              height: 21,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  LogInWidget.createRichTextWidget(
                      inputFirst: 'Didn’t get a code?',
                      inputLast: ' Try again',
                      colorFirst: const Color(0xFF020433),
                      colorLast: const Color(0xFF0F73EE),
                      height: 17,
                      fontSize: 14)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
