import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/widget/animation_wave/ripples_animation.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/log_in_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {this.heightIcon,
      this.icon,
      this.route,
      this.subTitle,
      this.textButton,
      this.title,
      this.widthIcon});
  final String icon;
  final double heightIcon;
  final double widthIcon;
  final String title;
  final String subTitle;
  final String textButton;
  final String route;

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Platform.isIOS
          ? SystemUiOverlayStyle.light
          : const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fill@1x.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 58),
                    child: RipplesAnimation(
                      size: width / 75 * 68,
                      color: const Color(0xFF020433),
                      icon: icon,
                      heightIcon: heightIcon,
                      widthIcon: widthIcon,
                    ),
                  ),
                  LogInWidget.createTextWidget(
                      input: title, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32, top: 15),
                    child: Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: AppWidget.simpleTextFieldStyle(
                          fontSize:
                              (14 / MediaQuery.of(context).textScaleFactor) *
                                  1.0,
                          color: Colors.white,
                          height: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 188),
                    child: AppWidget.typeButtonDoneAction(
                        context: context,
                        routes: route,
                        input: textButton,
                        width: width),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
