import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class StepFourWidget {
  static Widget createRichTextWidget(
      {String inputFirst,
      Color colorFirst,
      String inputLast,
      Color colorLast,
      double sizeFirst,
      double sizeLast,
      double heightFirst,
      double heightLast}) {
    return RichText(
        text: TextSpan(
            text: inputFirst,
            style: AppWidget.boldTextFieldStyle(
                color: colorFirst,
                fontSize: sizeFirst,
                height: heightFirst,
                fontWeight: FontWeight.w700),
            children: [
          TextSpan(
              text: inputLast,
              style: AppWidget.simpleTextFieldStyle(
                  color: colorLast, fontSize: sizeLast, height: heightLast))
        ]));
  }
}
