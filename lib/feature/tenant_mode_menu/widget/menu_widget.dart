import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

mixin MenuWidget {
  static Widget createItemOption(
      {BuildContext context, double height, Map<String, dynamic> item}) {
    return Container(
        height: height / 203 * 33,
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, 2),
                blurRadius: 5)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              item['icon'],
              height: 40,
              width: 40,
            ),
            Text(
              item['title'],
              maxLines: 2,
              textAlign: TextAlign.center,
              style: AppWidget.boldTextFieldStyle(
                  fontSize: 13,
                  height: 18,
                  color: const Color(0xFF020433),
                  fontWeight: FontWeight.w700),
            )
          ],
        ));
  }

  static Widget createHeader({UserModel user, double height}) {
    return Column(
      children: [
        SizedBox(
          height: height / 2.5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                user.imgAvt,
                height: 80,
                width: 80,
              ),
              Positioned(
                bottom: 0,
                right: -7,
                child: Image.asset(
                  'images/tenant_mode/ic_verified@3x.png',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height - height / 2.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  user.name,
                  style: AppWidget.boldTextFieldStyle(
                      fontSize: 24,
                      height: 29.26,
                      color: const Color(0xFF020433),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.type,
                      style: AppWidget.simpleTextFieldStyle(
                          fontSize: 14,
                          height: 17.07,
                          color: const Color(0xFF404B69)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Text('.',
                          style: AppWidget.simpleTextFieldStyle(
                              fontSize: 18,
                              height: 21.94,
                              color: const Color(0xFF404B69))),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  static Widget createPostSearch(
      {String title, String site, String money, String timeUpdate}) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppWidget.boldTextFieldStyle(
                color: const Color(0xFF020433),
                height: 19.5,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Text(
                site,
                style: AppWidget.simpleTextFieldStyle(
                    fontSize: 13,
                    height: 15.85,
                    color: const Color(0xFF404B69)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 39, right: 8, bottom: 10),
                child: Text(
                  '.',
                  style: AppWidget.simpleTextFieldStyle(
                      fontSize: 18,
                      height: 21.94,
                      color: const Color(0xFF404B69)),
                ),
              ),
              Text(
                money,
                style: AppWidget.simpleTextFieldStyle(
                    fontSize: 13,
                    height: 15.85,
                    color: const Color(0xFF404B69)),
              ),
            ],
          ),
          Text(
            timeUpdate,
            style: AppWidget.simpleTextFieldStyle(
                fontSize: 13, height: 15.85, color: const Color(0xFF95A0B6)),
          ),
        ],
      ),
    );
  }
}
