import 'dart:ui';

import 'package:flutter/material.dart';

class AppWidget {
  static double getHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget createSimpleAppBar(
      {BuildContext context, int currentStep, Function(int) switchStep}) {
    return Padding(
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
    );
  }

  static TextStyle simpleTextFieldStyle(
      {Color color, double fontSize, double height}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        height: height / fontSize,
        fontFamily: 'Montserrat');
  }

  static TextStyle boldTextFieldStyle(
      {Color color, double fontSize, FontWeight fontWeight, double height}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height / fontSize,
        fontFamily: 'Montserrat');
  }

  static Widget textErrorStyle(
      {String textError}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        textError,
        style: simpleTextFieldStyle(
            color: const Color(0xFFFC2F39), fontSize: 12, height: 14.63),
      ),
    );
  }

  static Widget typeButtonStartAction(
      {double fontSize,
      double height,
      double padTop,
      double padBottom,
      double width,
      String input}) {
    return Container(
      padding: EdgeInsets.only(top: padTop ?? 16, bottom: padBottom ?? 17),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F73EE),
            Color(0xFFC644FC),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        input,
        textAlign: TextAlign.center,
        style: AppWidget.boldTextFieldStyle(
            fontSize: fontSize ?? 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            height: height ?? 17),
      ),
    );
  }

  static Widget typeButtonDoneAction(
      {BuildContext context, String routes, String input, double width}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.white),
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: const EdgeInsets.symmetric(horizontal: 31.5, vertical: 16),
        child: Text(
          input,
          style: AppWidget.boldTextFieldStyle(
              fontSize: 14,
              color: const Color(0xFF020433),
              fontWeight: FontWeight.w500,
              height: 17),
        ),
        onPressed: () {
          if (routes == null) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pushReplacementNamed(routes);
          }
        },
      ),
    );
  }

  static Widget createSearchPlace({String hintText, double width}) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, 5),
                blurRadius: 10)
          ]),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: constraints.maxWidth * 0.2,
                  child: Image.asset('images/tenant_mode/ic_search_16@3x.png',
                      height: 16, width: 16)),
              SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: AppWidget.simpleTextFieldStyle(
                            color: const Color(0xFF95A0B6),
                            height: 17.07,
                            fontSize: 14)),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
