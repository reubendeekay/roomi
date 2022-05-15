import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/listing_full_width_widget.dart';
import 'package:roomy/app/widget_support.dart';

class MyListingWidget {
  static Widget createItemInActive({double width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'images/tenant_mode/ic_verified@3x.png',
              width: 16,
              height: 16,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: ListingFullWidthWidget.createText(
                    input: 'VERIFIED',
                    fontSize: 10,
                    color: const Color(0xFF08C299),
                    height: 12.19)),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child:
                  ListingFullWidthWidget.createDot(fontSize: 14, height: 17.07),
            ),
            ListingFullWidthWidget.createText(
                input: '2 BEDS',
                fontSize: 10,
                color: const Color(0xFF08C299),
                height: 12.19)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(
            'Huge Room Available off Old Kent Road',
            style: AppWidget.boldTextFieldStyle(
                color: const Color(0xFF020433),
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 21.94),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'INACTIVE',
              style: AppWidget.boldTextFieldStyle(
                  color: const Color(0xFFFC2F39),
                  fontSize: 14,
                  height: 17.07,
                  fontWeight: FontWeight.w500),
            ),
            AppWidget.typeButtonStartAction(
                input: 'Active Now',
                padTop: 12,
                padBottom: 13,
                width: (width - 48) / 3,
                fontSize: 13)
          ],
        )
      ],
    );
  }

  static Widget createItemIncomplete({double width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(
            'Luxury En Suite in Stunning River Front House',
            style: AppWidget.boldTextFieldStyle(
                color: const Color(0xFF020433),
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 21.94),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'INCOMPLETE',
              style: AppWidget.boldTextFieldStyle(
                  color: const Color(0xFFFC2F39),
                  fontSize: 14,
                  height: 17.07,
                  fontWeight: FontWeight.w500),
            ),
            AppWidget.typeButtonStartAction(
                input: 'Update Now',
                padTop: 12,
                padBottom: 13,
                width: (width - 48) / 3,
                fontSize: 13)
          ],
        )
      ],
    );
  }
}
