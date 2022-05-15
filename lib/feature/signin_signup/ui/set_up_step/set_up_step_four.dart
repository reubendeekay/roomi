import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

import '../set_up_step/form/form_step_four.dart';
import '../set_up_step/widget/step_four_widget.dart';
import 'widget/set_up_step_widget.dart';

class SetUpStepFour extends StatelessWidget {
  SetUpStepFour(
      {this.switchStep,
      this.fullNameController,
      this.emailController,
      this.birthdayController,
      this.infoMeController,
      this.cfPasswordController,
      this.jobController,
      this.passwordController,
      this.phoneController,
      this.placeController});
  final TextEditingController birthdayController;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController cfPasswordController;
  final TextEditingController jobController;
  final TextEditingController placeController;
  final TextEditingController infoMeController;
  final Function(int) switchStep;
  final List<String> listImage = [
    'images/log_in/btn_add_image@3x.png',
    'images/log_in/img_2_step_4@3x.png',
    'images/log_in/img_3_step_4@3x.png'
  ];
  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    final double width = AppWidget.getWidthScreen(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetUpStepWidget.createTitleWidget(
                  inputFirst: 'Create',
                  inputLast: 'Your Profile',
                  top: 40,
                  bottom: 32),
              FormStepFour(
                fullNameController: fullNameController,
                birthdayController: birthdayController,
                emailController: emailController,
                infoMeController: infoMeController,
                jobController: jobController,
                cfPasswordController: cfPasswordController,
                passwordController: passwordController,
                phoneController: phoneController,
                placeController: placeController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: StepFourWidget.createRichTextWidget(
                    inputFirst: 'Your Photos',
                    inputLast: ' (Max 5 photos)',
                    colorFirst: const Color(0xFF020433),
                    colorLast: const Color(0xFFFC2F39),
                    sizeFirst: 14,
                    sizeLast: 12,
                    heightFirst: 17.07,
                    heightLast: 14.63),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: SizedBox(
                  height: 250,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: width * 3 / height,
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: listImage.length,
                    itemBuilder: (context, index) {
                      return Image.asset(listImage[index], fit: BoxFit.fill);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
