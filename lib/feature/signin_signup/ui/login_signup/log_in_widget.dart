import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class LogInWidget {
  static Widget createTextWidget({String input, Color color}) {
    return FittedBox(
      child: Text(
        input,
        style: AppWidget.boldTextFieldStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            height: 37),
      ),
    );
  }

  static Widget createRichTextWidget(
      {String inputFirst,
      Color colorFirst,
      String inputLast,
      Color colorLast,
      double fontSize,
      double height}) {
    return FittedBox(
      child: RichText(
          text: TextSpan(
              text: inputFirst,
              style: AppWidget.simpleTextFieldStyle(
                  color: colorFirst, fontSize: fontSize, height: height),
              children: [
            TextSpan(
                text: inputLast,
                style: AppWidget.simpleTextFieldStyle(
                    color: colorLast, fontSize: fontSize, height: height))
          ])),
    );
  }

  static Widget createAppBarWidget({BuildContext context, double height}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 203 * 11),
      child: AppBar(
        brightness: Brightness.light,
        leading: AppWidget.createSimpleAppBar(context: context),
        elevation: 0,
      ),
    );
  }
}
