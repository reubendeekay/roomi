import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_profile_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import '../widget/list_amenities_widget.dart';

class FindNewDetailWidget {
  static Widget createListQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LandlordProfileWidget.createBoldText(
            input: 'How often do you clean your apartment?'),
        LandlordProfileWidget.createText(input: 'Every few days'),
        LandlordProfileWidget.createBoldText(input: 'Do you smoke?'),
        LandlordProfileWidget.createText(input: 'Yes'),
        LandlordProfileWidget.createBoldText(
            input: 'How do you feel about pets?'),
        LandlordProfileWidget.createText(input: 'I live with a pet of my own!'),
        LandlordProfileWidget.createBoldText(input: 'How about guests?'),
        LandlordProfileWidget.createText(input: 'Only during the day'),
      ],
    );
  }

  static Widget createInfoAge({double width}) {
    return Row(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 17),
              child: Text(
                '36',
                style: AppWidget.simpleTextFieldStyle(
                    height: 17.07,
                    fontSize: 14,
                    color: const Color(0xFF020433)),
              ),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 17),
                child: Text(
                  'Product Designer',
                  style: AppWidget.simpleTextFieldStyle(
                      height: 17.07,
                      fontSize: 14,
                      color: const Color(0xFF020433)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  static Widget createDescription(
      {double width,
      List<String> amenities,
      List<String> rules,
      String address,
      List<String> availability,
      List<String> lookingFor,
      List<String> description}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 43),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FindNewDetailWidget.createInfoAge(width: width),
          LandlordDetailWidget.createLine(),
          TenantListingWidget.createSubTitle(
              text: 'Description', top: 32, bottom: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              description.first,
              style: AppWidget.boldTextFieldStyle(
                  color: const Color(0xFF020433),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  height: 21.94),
            ),
          ),
          LandlordDetailWidget.createReadMore(text: description.last),
          LandlordDetailWidget.createLine(),
          TenantListingWidget.createSubTitle(
              text: 'Looking for', top: 32, bottom: 16),
          LandlordDetailWidget.createText(text: lookingFor.first),
          LandlordDetailWidget.createText(
              text: lookingFor.last, top: 9, bottom: 25),
          LandlordDetailWidget.createLine(),
          TenantListingWidget.createSubTitle(
              text: 'Bedroom Type', top: 32, bottom: 16),
          LandlordDetailWidget.createText(text: 'A Single Bed', bottom: 25),
          LandlordDetailWidget.createLine(),
          TenantListingWidget.createSubTitle(
              text: 'Availability', top: 32, bottom: 16),
          LandlordDetailWidget.createText(text: availability.first),
          LandlordDetailWidget.createText(
              text: availability.last, top: 9, bottom: 25),
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
              text: 'Search area', top: 32, bottom: 16),
          LandlordDetailWidget.createText(text: address),
        ],
      ),
    );
  }
}
