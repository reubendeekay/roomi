import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

mixin LandlordModeWidget {
  static Widget createSubText({String text, double top, double bottom}) {
    return Padding(
      padding: EdgeInsets.only(top: top ?? 0, bottom: bottom ?? 0),
      child: Text(
        text,
        style: AppWidget.simpleTextFieldStyle(
            fontSize: 13, height: 15.85, color: const Color(0xFF020433)),
      ),
    );
  }

  static Widget createContainerNav(
      {BuildContext context,
      double height,
      bool hasShadow,
      Function onTap,
      Function(int) switchStep,
      int step,
      String route,
      String input}) {
    return Container(
      height: height ?? 66,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: hasShadow
              ? const [
                  BoxShadow(
                    color: Color.fromRGBO(2, 4, 51, 0.08),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ]
              : []),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 4),
      child: GestureDetector(
          onTap: () {
            if (route == null && switchStep == null) {
              onTap();
            } else if (route == null) {
              switchStep(step);
            } else {
              Navigator.of(context).pushNamed(route);
            }
          },
          child: AppWidget.typeButtonStartAction(input: input)),
    );
  }

  static Widget createAppBar(
      {BuildContext context, Function(int) switchStep, int currentStep}) {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.light,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (currentStep == null || currentStep - 1 == 0) {
                  Navigator.of(context).pop();
                } else {
                  switchStep(currentStep - 1);
                }
              },
              child: Image.asset(
                'images/log_in/ic@3x.png',
                height: 18,
                width: 22,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      elevation: 0,
      title: Text(
        'Step $currentStep-6',
        style: AppWidget.boldTextFieldStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF020433),
            height: 19.5),
      ),
      actions: [
        currentStep != 1
            ? Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Center(
                  child: Text(
                    'Save',
                    style: AppWidget.simpleTextFieldStyle(
                        fontSize: 14,
                        height: 17.07,
                        color: const Color(0xFF0F73EE)),
                  ),
                ),
              )
            : const SizedBox()
      ],
      bottom: PreferredSize(
        preferredSize: const Size(0, 0),
        child: StepProgressIndicator(
          totalSteps: 6,
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
    );
  }
}
