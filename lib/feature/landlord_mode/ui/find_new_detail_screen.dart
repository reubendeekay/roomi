import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/landlord_mode/widget/landlord_mode_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/map_view_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/custom_google_map.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/sab_landlord_profile.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/similar_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widget/bottom_nav_widget.dart';
import '../widget/find_new_detail_widget.dart';

class FindNewDetailScreen extends StatelessWidget {
  FindNewDetailScreen({this.infoFindNewDetail});
  final Map<String, dynamic> infoFindNewDetail;
  final Set<Circle> circles = {
    Circle(
        circleId: CircleId('Here'),
        center: const LatLng(21.037763, 105.834160),
        radius: 400,
        strokeColor: const Color(0xFF0F73EE),
        strokeWidth: 2,
        fillColor: const Color.fromRGBO(2, 4, 51, 0.08))
  };
  final List<String> amenities = [
    'ic_washing@3x.png',
    'ic_router@3x.png',
    'ic_armchair@3x.png',
    'ic_elevator@3x.png',
    'ic_radiator@3x.png',
    'ic_bathtub@3x.png',
    'ic_air_conditioner@3x.png'
  ];
  final List<String> rules = [
    'ic_no_drinks@3x.png',
    'ic_marijuana@3x.png',
    'ic_dog@3x.png',
    'ic_couple@3x.png',
  ];
  final String address = 'Brooklyn, NY';
  final List<String> availability = ['Jul 6, 2018', 'Minimum term 6-12 months'];
  final List<String> lookingFor = [
    'A Signle/Double Room',
    'Or roommate is Female in their late 24s-32s'
  ];
  final List<String> description = [
    '25 Year Old Female seeks Single/Double or Roommate',
    'I am Esther, 24 years old. I am looking for DOUBLE ROOM WITH ENSUIT......I study MA(master of art) in theatre'
  ];

  final List<Map<String, dynamic>> similarList = [
    <String, dynamic>{
      'img': 'images/landlord_mode/img_9@3x.png',
      'beds': '2 BEDS',
      'title': 'Looking for a double room in Clapham',
      'totalMoney': '650',
      'status': 'Available Now',
      'timeLease': '6 months min term',
      'favored': false
    },
    <String, dynamic>{
      'img': 'images/landlord_mode/img_10@3x.png',
      'beds': '2 BEDS',
      'title': 'Male professional (28) Clerkenwell & around',
      'totalMoney': '800',
      'status': 'Available Now',
      'timeLease': '12 month lease',
      'favored': false
    }
  ];
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SabLandlordProfile(
              height: height, listImage: infoFindNewDetail['image']),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LandlordModeWidget.createInfoUser(
                        infoUser: infoFindNewDetail['infoUser']),
                    FindNewDetailWidget.createDescription(
                        width: width,
                        description: description,
                        address: address,
                        amenities: amenities,
                        rules: rules,
                        availability: availability,
                        lookingFor: lookingFor),
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.of(context).pushNamed(Routes.mapViewScreen,
                            arguments: MapViewScreen(
                              circles: circles,
                              zoom: 15,
                            ));
                      },
                      child: SizedBox(
                          height: 280,
                          width: double.infinity,
                          child: CustomGoogleMap(
                            circles: circles,
                            zoomGesturesEnabled: false,
                            zoom: 15,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TenantListingWidget.createSubTitle(
                              text: 'Questionaires', top: 32, bottom: 16),
                          FindNewDetailWidget.createListQuestion(),
                          LandlordDetailWidget.createLine(),
                          TenantListingWidget.createSubTitle(
                              text: 'Similar Ads', top: 32, bottom: 24),
                        ],
                      ),
                    ),
                    SimilarListingWidget(
                      hasVerify: false,
                      similarList: similarList,
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: const SafeArea(
        child: BottomNavWidget(
          colorButton: Color(0xFF0F73EE),
        ),
      ),
    );
  }
}
