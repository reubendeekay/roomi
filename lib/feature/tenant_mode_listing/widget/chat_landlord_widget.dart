import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

mixin ChatLandlordWidget {
  static Widget createAppBar({BuildContext context, UserModel user}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      brightness: Brightness.light,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'images/log_in/ic@3x.png',
                width: 24,
                height: 24,
              ),
            )
          ],
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.name,
            style: AppWidget.boldTextFieldStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 19.5,
                color: const Color(0xFF020433)),
          ),
          Image.asset(
            'images/tenant_mode/ic_verified@3x.png',
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  static Widget createAction(String icon) {
    return Image.asset(
      icon,
      height: 24,
      width: 24,
    );
  }
}
