import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/item_nav_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/listing_full_width_widget.dart';

class LandlordModeWidget {
  static BottomNavigationBarItem createItemNavStack(
      {ItemNavModel itemNavModel}) {
    return BottomNavigationBarItem(
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            createIcon(
                imageIcon: itemNavModel.imageIcon,
                selected: itemNavModel.selected),
            Positioned(
                top: -7,
                right: -10,
                child: Container(
                  width: 16,
                  decoration: const BoxDecoration(
                      color: Color(0xFFED3269), shape: BoxShape.circle),
                  child: Text(
                    '2',
                    style: AppWidget.boldTextFieldStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 14.63,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
        label: itemNavModel.label);
  }

  static BottomNavigationBarItem createItemNav({ItemNavModel itemNavModel}) {
    return BottomNavigationBarItem(
        icon: createIcon(
            imageIcon: itemNavModel.imageIcon, selected: itemNavModel.selected),
        label: itemNavModel.label);
  }

  static BottomNavigationBarItem createItemNavMenu(
      {ItemNavModel itemNavModel}) {
    return BottomNavigationBarItem(
        icon: itemNavModel.selected
            ? const Icon(
                Icons.close,
                color: Color(0xFF0F73EE),
                size: 25,
              )
            : Image.asset(
                itemNavModel.imageIcon,
                height: 24,
                width: 24,
                fit: BoxFit.cover,
                color: itemNavModel.selected
                    ? const Color(0xFF0F73EE)
                    : const Color(0xFF404B69),
              ),
        label: itemNavModel.label);
  }

  static Widget createIcon({String imageIcon, bool selected}) {
    return Image.asset(
      imageIcon,
      height: 24,
      width: 24,
      fit: BoxFit.cover,
      color: selected ? const Color(0xFF0F73EE) : const Color(0xFF404B69),
    );
  }

  static Widget createInfoUser({List<dynamic> infoUser}) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              infoUser[0],
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
            infoUser[1],
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
              infoUser[2],
              style: AppWidget.simpleTextFieldStyle(
                  height: 17.07, fontSize: 14, color: const Color(0xFF020433)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child:
                  ListingFullWidthWidget.createDot(fontSize: 18, height: 21.94),
            ),
            Text(
              infoUser[3],
              style: AppWidget.boldTextFieldStyle(
                  height: 17.07, fontSize: 14, color: const Color(0xFF020433)),
            ),
          ],
        )
      ],
    );
  }
}
