import 'package:flutter/material.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/signin_signup/ui/success_screen.dart';

class SetUpSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SuccessScreen(
        icon: 'images/log_in/ic_signup_complete_line@3x.png',
        widthIcon: 104.8,
        heightIcon: 120,
        title: 'Welcome Roomy!',
        subTitle:
            'Now we have 5 questions will help you match with like minded roommate.',
        textButton: "LET'S START",
        route: Routes.questionnairesScreen);
  }
}
