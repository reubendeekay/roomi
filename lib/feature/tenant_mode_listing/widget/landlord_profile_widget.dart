import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/listing_full_width_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';

mixin LandlordProfileWidget {
  static Widget createText({String input, double top, double bottom}) {
    return Padding(
      padding: EdgeInsets.only(top: top ?? 9, bottom: bottom ?? 25),
      child: Text(
        input,
        style: AppWidget.simpleTextFieldStyle(
            color: const Color(0xFF020433), fontSize: 14, height: 17.07),
      ),
    );
  }

  static Widget createBoldText({String input}) {
    return Text(
      input,
      style: AppWidget.boldTextFieldStyle(
          color: const Color(0xFF020433),
          fontSize: 14,
          height: 17.07,
          fontWeight: FontWeight.w500),
    );
  }

  static Widget createAboutMe({double width, @required UserModel user}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 43, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Age',
                    style: AppWidget.boldTextFieldStyle(
                        height: 17.07,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF020433)),
                  ),
                  Text(
                    user.age.toString(),
                    style: AppWidget.simpleTextFieldStyle(
                        height: 17.07,
                        fontSize: 14,
                        color: const Color(0xFF020433)),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Work in',
                      style: AppWidget.boldTextFieldStyle(
                          height: 17.07,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF020433)),
                    ),
                    Text(
                      user.occupation,
                      style: AppWidget.simpleTextFieldStyle(
                          height: 17.07,
                          fontSize: 14,
                          color: const Color(0xFF020433)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        LandlordDetailWidget.createLine(),
        TenantListingWidget.createSubTitle(
            text: 'About me', top: 32, bottom: 16),
        LandlordDetailWidget.createReadMore(
          text: user.aboutUser,
        ),
        LandlordDetailWidget.createLine(),
      ],
    );
  }

  static Widget createMyHobby(UserModel user) {
    final len = user.questionnaires.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TenantListingWidget.createSubTitle(
            text: 'Languages', top: 32, bottom: 16),
        LandlordDetailWidget.createText(
            text: 'English - French', bottom: 24, top: 16),
        LandlordDetailWidget.createLine(),
        TenantListingWidget.createSubTitle(
            text: 'Prefer Location', top: 32, bottom: 16),
        LandlordDetailWidget.createText(
            text: user.prefferedLocation, bottom: 24, top: 16),
        LandlordDetailWidget.createLine(),
        TenantListingWidget.createSubTitle(
            text: 'Interested in', top: 32, bottom: 16),
        LandlordDetailWidget.createText(
            text: user.questionnaires[len - 1]['attributes'].join(' - '),
            bottom: 24,
            top: 16),
        LandlordDetailWidget.createLine(),
        TenantListingWidget.createSubTitle(
            text: 'Questionaires', top: 32, bottom: 16),
        LandlordProfileWidget.createBoldText(
            input: 'How often do you clean your apartment?'),
        LandlordProfileWidget.createText(input: user.questionnaires[0]),
        LandlordProfileWidget.createBoldText(input: 'Do you smoke?'),
        LandlordProfileWidget.createText(input: user.questionnaires[1]),
        LandlordProfileWidget.createBoldText(
            input: 'How do you feel about pets?'),
        LandlordProfileWidget.createText(input: user.questionnaires[2]),
        LandlordProfileWidget.createBoldText(input: 'How about guests?'),
        LandlordProfileWidget.createText(input: user.questionnaires[3]),
        LandlordDetailWidget.createLine(),
      ],
    );
  }

  static Widget createInfoProfile({double width, @required UserModel user}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  user.imgAvt,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  right: -8,
                  child: Image.asset(
                    'images/tenant_mode/ic_verified@3x.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              child: Text(
                user.name,
                style: AppWidget.boldTextFieldStyle(
                    height: 29.26,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF020433)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.type,
                  style: AppWidget.simpleTextFieldStyle(
                      height: 17.07,
                      fontSize: 14,
                      color: const Color(0xFF020433)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ListingFullWidthWidget.createDot(
                      fontSize: 18, height: 21.94),
                ),
                Text(
                  user.prefferedLocation.substring(1, 2),
                  style: AppWidget.boldTextFieldStyle(
                      height: 17.07,
                      fontSize: 14,
                      color: const Color(0xFF020433)),
                ),
              ],
            )
          ],
        ),
        createAboutMe(width: width, user: user),
        TenantListingWidget.createSubTitle(
            text: 'Social Connections', top: 32, bottom: 16),
        LandlordDetailWidget.createText(
            text: 'See how you???re connected to Mokua', bottom: 16, top: 16),
        Container(
          height: 148,
          margin: const EdgeInsets.only(bottom: 24),
          padding:
              const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 24),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xFFF7F9FF)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Connect your social accounts to discover your connections with him',
                  textAlign: TextAlign.center,
                  style: AppWidget.simpleTextFieldStyle(
                      height: 21, fontSize: 12, color: const Color(0xFF404B69)),
                ),
              ),
              AppWidget.typeButtonStartAction(input: 'CONNECT'),
            ],
          ),
        ),
        LandlordDetailWidget.createLine(),
        createMyHobby(user),
        TenantListingWidget.createSubTitle(
            text: 'Room List', top: 32, bottom: 16),
      ],
    );
  }
}
