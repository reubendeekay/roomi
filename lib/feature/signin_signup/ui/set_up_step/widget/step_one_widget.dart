import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

// ignore: avoid_classes_with_only_static_members
class StepOneWidget {
  static Widget createBoxStepOne(
      {String background, String icon, String title}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
              image: AssetImage(background), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Image.asset(icon, height: 58, fit: BoxFit.cover),
          ),
          FittedBox(
            child: Text(
              title,
              style: AppWidget.boldTextFieldStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 19.5),
            ),
          )
        ],
      ),
    );
  }
}
