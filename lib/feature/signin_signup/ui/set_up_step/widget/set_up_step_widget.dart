import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/log_in_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SetUpStepWidget {
  static Widget createAppBarWidget(
      {BuildContext context,
      double height,
      String title,
      int currentStep,
      Function(int) switchStep}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 203 * 11),
      child: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        leading: AppWidget.createSimpleAppBar(
            context: context, switchStep: switchStep, currentStep: currentStep),
        elevation: 0,
        title: Text(
          title,
          style: AppWidget.boldTextFieldStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF020433),
              height: 19.5),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(0, 0),
          child: StepProgressIndicator(
            totalSteps: 5,
            currentStep: currentStep,
            padding: 0,
            size: 2,
            unselectedColor: Colors.white,
            selectedGradientColor: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F73EE), Color(0xFFC644FC)],
            ),
          ),
        ),
      ),
    );
  }

  static Widget createTitleWidget(
      {String inputFirst,
      String inputLast,
      double top,
      double bottom,
      double left,
      double right}) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0.0,
          bottom: bottom ?? 0.0,
          left: left ?? 0.0,
          right: right ?? 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogInWidget.createTextWidget(
              input: inputFirst, color: const Color(0xFF020433)),
          LogInWidget.createTextWidget(
              input: inputLast, color: const Color(0xFF020433)),
        ],
      ),
    );
  }
}
