import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/landlord_profile_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/map_view_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomy/feature/landlord_mode/widget/list_amenities_widget.dart';

import 'custom_google_map.dart';
import 'landlord_detail_widget.dart';

class InfoLandlordRoomDetail extends StatelessWidget {
  const InfoLandlordRoomDetail(
      {this.room,
      this.titleRoom,
      this.infoUser,
      this.circles,
      this.summary,
      this.currentRoommates,
      this.amenities,
      this.rules,
      this.address,
      this.description,
      this.availability,
      this.lookingFor,
      this.reviews,
      this.hasSimilar,
      this.viewProfile});
  final RoomModel room;

  final Map<String, String> titleRoom;
  final Map<String, dynamic> infoUser;
  final Set<Circle> circles;
  final List<Map<String, dynamic>> summary;
  final List<String> amenities;
  final List<String> rules;
  final String address;
  final List<String> currentRoommates;
  final List<String> availability;
  final List<String> lookingFor;
  final String description;
  final Map<String, String> reviews;
  final bool hasSimilar;
  final bool viewProfile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LandlordDetailWidget.createTitleRoom(
            summary: summary,
            title: room.post.title,
            totalMoney: room.post.rentAmount,
            deposit: room.post.deposit),
        DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFFF7F9FF)),
            child: viewProfile
                ? InkWell(
                    onTap: () {
                      Get.to(() => LandlordProfileScreen(user: room.user));
                    },
                    child: TenantListingWidget.createListTile(
                        imgAvt: room.user.imgAvt,
                        name: room.user.name,
                        type: 'Landlord',
                        male: room.user.gender),
                  )
                : TenantListingWidget.createListTile(
                    imgAvt: room.user.imgAvt,
                    name: room.user.name,
                    type: 'Landlord',
                    male: room.user.gender)),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currentRoommates != null
                  ? TenantListingWidget.createSubTitle(
                      text: 'Current Roommates', top: 32, bottom: 16)
                  : const SizedBox(),
              currentRoommates != null
                  ? LandlordDetailWidget.createText(
                      text: currentRoommates.first)
                  : const SizedBox(),
              currentRoommates != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 17, bottom: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            currentRoommates.last,
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'images/tenant_mode/ic_verified@3x.png',
                            width: 16,
                            height: 16,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              currentRoommates != null
                  ? LandlordDetailWidget.createLine()
                  : const SizedBox(),
              TenantListingWidget.createSubTitle(
                  text: 'Availability', top: 32, bottom: 16),
              LandlordDetailWidget.createText(text: room.post.state),
              LandlordDetailWidget.createText(
                  text: availability.last, top: 9, bottom: 25),
              LandlordDetailWidget.createLine(),
              TenantListingWidget.createSubTitle(
                  text: 'Looking for', top: 32, bottom: 16),
              LandlordDetailWidget.createText(text: 'A tenant who is'),
              LandlordDetailWidget.createText(
                  text:
                      '${room.post.prefferedGender} and a ${room.post.prefferedOccupation}',
                  top: 9,
                  bottom: 25),
              LandlordDetailWidget.createLine(),
              TenantListingWidget.createSubTitle(
                  text: 'Description', top: 32, bottom: 17),
              Text(
                'The Space:',
                style: AppWidget.boldTextFieldStyle(
                    color: const Color(0xFF020433),
                    height: 24,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '- - -',
                style: AppWidget.simpleTextFieldStyle(
                    fontSize: 14, height: 24, color: const Color(0xFF020433)),
              ),
              LandlordDetailWidget.createReadMore(text: room.post.description),
              LandlordDetailWidget.createLine(),
              TenantListingWidget.createSubTitle(
                  text: 'Amenities', top: 32, bottom: 24),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ListAmenitiesWidget(
                  amenities: amenities,
                ),
              ),
              LandlordDetailWidget.createLine(),
              TenantListingWidget.createSubTitle(
                  text: 'Rules', top: 32, bottom: 24),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ListAmenitiesWidget(
                  amenities: rules,
                ),
              ),
              LandlordDetailWidget.createLine(),
              TenantListingWidget.createSubTitle(
                  text: 'Location', top: 32, bottom: 5),
            ],
          ),
        ),
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
      ],
    );
  }
}
