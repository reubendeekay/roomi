import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_profile_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/providers/auth_provider.dart';

import '../widget/menu_widget.dart';
import '../widget/sab_my_profile_widget.dart';

class MyProfileScreen extends StatelessWidget {
  final List<String> listImage = [
    'images/tenant_mode/img_profile@3x.png',
    'images/tenant_mode/img_profile@3x.png',
    'images/tenant_mode/img_profile@3x.png',
    'images/tenant_mode/img_profile@3x.png'
  ];
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SabMyProfileWidget(height: height, listImage: [user.imgAvt]),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    LandlordProfileWidget.createAboutMe(
                        width: width, user: user),
                    LandlordProfileWidget.createMyHobby(user),
                    LandlordDetailWidget.createLine(),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
