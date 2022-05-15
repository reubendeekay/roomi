import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/sab_landlord_room_detail.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/similar_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/info_landlord_room_detail.dart';

class LandlordDetailScreen extends StatelessWidget {
  LandlordDetailScreen({this.room});
  final RoomModel room;
  final Map<String, String> titleRoom = {
    'title': '1 Double Room for Rent in Carroll Garden',
    'totalMoney': '800',
    'deposit': '700',
  };
  final Map<String, dynamic> infoUser = <String, dynamic>{
    'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
    'name': 'Mokua Lawrence',
    'age': '36',
    'type': 'Landlord',
    'male': true,
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
  final String address = 'Seabring Street, Brooklyn, NY';
  final List<String> availability = ['Jul 6, 2018', 'Minimum stay 12 months'];
  final List<String> lookingFor = [
    'A tenant who is',
    'Male or Female in their late 24s-32s'
  ];
  final String description =
      'New luxury high-rise in the heart of downtown Brooklyn.'
      ' Directly above a Jay Street-Metro Tech Subway Station with';
  final Map<String, String> reviews = {
    'avatar': 'images/tenant_mode/img_avatar_2@3x.png',
    'name': 'Grace Thornton',
    'subtitle': 'Latest tenant',
    'description':
        'Great location, very clean, perfect for our family of two parents'
            ' and two grown children with their partners. We did not use'
  };
  final List<Map<String, dynamic>> similarList = [
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
  final List<String> listImage = [
    'images/tenant_mode/img_landlord_1@3x.png',
    'images/tenant_mode/img_landlord_1@3x.png',
    'images/tenant_mode/img_landlord_1@3x.png',
    'images/tenant_mode/img_landlord_1@3x.png'
  ];
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final List<Map<String, dynamic>> summary = [
      <String, dynamic>{
        'icon': 'ic_roommate_landlord@3x.png',
        'title': 'Max 2 persons'
      },
      <String, dynamic>{
        'icon': 'ic_bed_landlord@3x.png',
        'title': '${room.post.amountBed} beds'
      },
      <String, dynamic>{
        'icon': 'ic_bedroom_landlord@3x.png',
        'title': '${room.post.amountBed} bedrooms'
      },
      <String, dynamic>{
        'icon': 'ic_shower_landlord@3x.png',
        'title': '${room.post.amountBath} bath'
      }
    ];
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            AppBarLandlordRoomDetail(
                height: height, listImage: room.post.images),
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
                                room: room,
                                circles: circles,
                                summary: summary,
                                amenities: amenities,
                                rules: rules,
                                address: address,
                                availability: availability,
                                lookingFor: lookingFor,
                                infoUser: infoUser,
                                reviews: reviews,
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
                room: room,
                totalMoney: room.post.rentAmount,
                deposit: room.post.deposit),
          ),
        ));
  }
}
