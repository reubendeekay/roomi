import 'package:flutter/material.dart';

import '../success_screen.dart';

class ResetSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SuccessScreen(
        icon: 'images/log_in/ic_success@3x.png',
        widthIcon: 120,
        heightIcon: 120,
        title: 'Successful!',
        subTitle:
            'You have successfully change password. Please use your new password when logging in.',
        textButton: 'LOGIN NOW');
  }
}
