import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/signin_signup/ui/success_screen.dart';
import 'package:roomy/providers/auth_provider.dart';

class QuestionSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    return SuccessScreen(
        icon: 'images/log_in/ic_success@3x.png',
        widthIcon: 120,
        heightIcon: 120,
        title: 'Great!',
        subTitle:
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.',
        textButton: 'FIND YOUR NEW PLACE',
        route: user.isLandlord
            ? Routes.landlordModeScreen
            : Routes.tenantModeScreen);
  }
}
