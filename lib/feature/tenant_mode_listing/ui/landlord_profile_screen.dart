import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/landlord_mode/widget/bottom_nav_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_profile_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/similar_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/sab_landlord_profile.dart';

class LandlordProfileScreen extends StatefulWidget {
  @override
  _LandlordProfileScreenState createState() => _LandlordProfileScreenState();
}

class _LandlordProfileScreenState extends State<LandlordProfileScreen> {
  List<String> listImage = [
    'images/tenant_mode/img_landlord_profile@3x.png',
    'images/tenant_mode/img_landlord_profile@3x.png',
    'images/tenant_mode/img_landlord_profile@3x.png',
    'images/tenant_mode/img_landlord_profile@3x.png'
  ];
  List<Map<String, dynamic>> similarList = [
    <String, dynamic>{
      'img': 'images/tenant_mode/img_landlord_2@3x.png',
      'beds': '2 BEDS',
      'title': 'Nice Double Room with Own Bathroom',
      'totalMoney': '650',
      'status': 'Available Now',
      'timeLease': '12 month lease',
      'favored': false
    },
    <String, dynamic>{
      'img': 'images/tenant_mode/img_landlord_3@3x.png',
      'beds': '2 BEDS',
      'title': '1 Double Room for Rent in Carroll Garden',
      'totalMoney': '800',
      'status': 'Available Now',
      'timeLease': '12 month lease',
      'favored': false
    }
  ];
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SabLandlordProfile(height: height, listImage: listImage),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                SizedBox(
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, left: 24, right: 24),
                          child: LandlordProfileWidget.createInfoProfile(
                              width: width),
                        ),
                        SimilarListingWidget(
                          similarList: similarList,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]))
        ],
      ),
      bottomNavigationBar: const SafeArea(
          child: BottomNavWidget(
        colorButton: Color(0xFF95A0B6),
      )),
    );
  }
}
