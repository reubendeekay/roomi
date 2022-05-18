import 'package:flutter/material.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/step_one_widget.dart';

class SetUpStepOne extends StatelessWidget {
  const SetUpStepOne({this.switchStep, this.onChanged});
  final Function(int) switchStep;
  final Function(String val) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SetUpStepWidget.createTitleWidget(
                  inputFirst: 'What are you',
                  inputLast: 'looking for?',
                  top: 40,
                  bottom: 64),
            ),
            GridView.count(
              childAspectRatio: 1,
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    switchStep(2);
                    onChanged('Roommate');
                  },
                  child: StepOneWidget.createBoxStepOne(
                      background: 'images/log_in/bg_3_step_1@3x.png',
                      icon: 'images/log_in/ic_3_step_1@3x.png',
                      title: 'Roommate'),
                ),
                GestureDetector(
                  onTap: () {
                    switchStep(2);
                    onChanged('Tenant');
                  },
                  child: StepOneWidget.createBoxStepOne(
                      background: 'images/log_in/bg_4_step_1@3x.png',
                      icon: 'images/log_in/ic_4_step_1@3x.png',
                      title: 'Tenant'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
