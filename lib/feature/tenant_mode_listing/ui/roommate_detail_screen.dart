import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/sab_landlord_room_detail.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/info_landlord_room_detail.dart';

class RoommateDetailScreen extends StatelessWidget {
  final Map<String, String> titleRoom = {
    'title': 'Nice Double Room with Own Bathroom',
    'totalMoney': '650',
    'deposit': '600',
  };
  final Map<String, dynamic> infoUser = <String, dynamic>{
    'imgAvt': 'images/tenant_mode/img_avatar@3x.png',
    'name': 'Susie Jenkins',
    'age': '25',
    'type': 'Roommate',
    'male': false,
  };
  final Set<Circle> circles = {
    Circle(
        circleId: CircleId('Here'),
        center: const LatLng(21.037763, 105.834160),
        radius: 400,
        strokeColor: const Color(0xFF0F73EE),
        strokeWidth: 2,
        fillColor: const Color.fromRGBO(2, 4, 51, 0.08))
  };
  final List<Map<String, dynamic>> summary = [
    <String, dynamic>{
      'icon': 'ic_roommate_landlord@3x.png',
      'title': 'Find 1 roommate'
    },
    <String, dynamic>{'icon': 'ic_bed_landlord@3x.png', 'title': '3 beds'},
    <String, dynamic>{
      'icon': 'ic_bedroom_landlord@3x.png',
      'title': '2 bedrooms'
    },
    <String, dynamic>{'icon': 'ic_shower_landlord@3x.png', 'title': '1 bath'}
  ];
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
  ];
  final String address = 'Atlantic Ave Street, Brooklyn, NY';
  final List<String> availability = ['For now', 'Minimum stay 6 months'];
  final List<String> currentRoommates = [
    'Me and my girl friend',
    'images/tenant_mode/ic_female_filter@3x.png'
  ];
  final List<String> lookingFor = [
    'A roommate who is',
    'Female in their late 24s-32s'
  ];
  final String description =
      'The space: True 2 Bedroom and 1 bath apartment with great size'
      ' living room, kitchen, marble bath, and washer';
  final List<Map<String, dynamic>> similarList = [
    <String, dynamic>{
      'img': 'images/tenant_mode/img_roommate@3x.png',
      'beds': '2 BEDS',
      'title': 'Nice Double Room with Own Bathroom',
      'totalMoney': '650',
      'status': 'Available Now',
      'timeLease': '12 month lease',
      'favored': false
    },
    <String, dynamic>{
      'img': 'images/tenant_mode/img_roommate_2@3x.png',
      'beds': '2 BEDS',
      'title': '1 Double Room for Rent in Carroll Garden',
      'totalMoney': '800',
      'status': 'Available Now',
      'timeLease': '12 month lease',
      'favored': false
    }
  ];
  final List<String> listImage = [
    'images/tenant_mode/img@3x.png',
    'images/tenant_mode/img@3x.png',
    'images/tenant_mode/img@3x.png',
    'images/tenant_mode/img@3x.png'
  ];
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            AppBarLandlordRoomDetail(height: height, listImage: listImage),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    SizedBox(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoLandlordRoomDetail(
                                circles: circles,
                                summary: summary,
                                amenities: amenities,
                                rules: rules,
                                address: address,
                                currentRoommates: currentRoommates,
                                availability: availability,
                                lookingFor: lookingFor,
                                infoUser: infoUser,
                                titleRoom: titleRoom,
                                description: description,
                                hasSimilar: true,
                                viewProfile: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 66,
            child: LandlordDetailWidget.createButtonRequest(
                context: context,
                totalMoney: titleRoom['totalMoney'],
                deposit: titleRoom['deposit']),
          ),
        ));
  }
}
