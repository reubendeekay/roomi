import 'package:flutter/material.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/signin_signup/ui/success_screen.dart';

class YourPostCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SuccessScreen(
        icon: 'images/log_in/ic_success@3x.png',
        widthIcon: 120,
        heightIcon: 120,
        title: 'Your Ads Posted!',
        subTitle:
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.',
        textButton: 'GO YOUR LISTING',
        route: Routes.landlordModeScreen);
  }
}
