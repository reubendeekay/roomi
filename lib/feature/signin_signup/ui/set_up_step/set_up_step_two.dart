import 'package:flutter/material.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/step_two_widget.dart';

class SetUpStepTwo extends StatelessWidget {
  SetUpStepTwo({this.switchStep, this.onChanged});
  final Function(String val) onChanged;

  final Function(int) switchStep;
  final List<Map<String, String>> listCity = [
    {
      'image': 'images/log_in/img_1_step_2@3x.png',
      'title': 'Nairobi',
      'subTitle': 'KE'
    },
    {
      'image': 'images/log_in/img_2_step_2@3x.png',
      'title': 'Mombasa',
      'subTitle': 'Kenya'
    },
    {
      'image': 'images/log_in/img_3_step_2@3x.png',
      'title': 'Nakuru',
      'subTitle': 'Kenya'
    },
    {
      'image': 'images/log_in/img_4_step_2@3x.png',
      'title': 'Kisumu',
      'subTitle': 'Kenya'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SetUpStepWidget.createTitleWidget(
                  inputFirst: 'Where',
                  inputLast: 'are you going?',
                  top: 40,
                  bottom: 32),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 151 / 255,
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: listCity.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      switchStep(3);
                      onChanged(listCity[index]['title']);
                    },
                    child:
                        StepTwoWidget.createItemStepTwo(city: listCity[index]));
              },
            )
          ],
        ),
      ),
    );
  }
}
