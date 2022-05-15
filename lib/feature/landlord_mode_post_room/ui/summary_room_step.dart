import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/choose_item_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/segment_control_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/slider_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';

import '../../tenant_mode_listing/data_test.dart';
import '../widget/landlord_mode_widget.dart';

class SummaryRoomStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SetUpStepWidget.createTitleWidget(
                    inputFirst: 'Preferred',
                    inputLast: 'Roommates',
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: LandlordModeWidget.createSubText(
                        text: 'Number of roommates already living there',
                        top: 32,
                        bottom: 16)),
                SegmentControlWidget(
                  width: width,
                  length: 8,
                ),
                TenantListingWidget.createSubTitle(
                    text: 'Preferred Gender', bottom: 16, top: 40),
                ChooseItemWidget(sampleData: DataTest.gender),
                TenantListingWidget.createSubTitle(
                    text: 'Preferred Age', top: 30, bottom: 0),
              ],
            ),
          ),
          const SliderWidget(
              typeLabel: 'age',
              labelOne: '16s',
              labelTwo: '65s',
              max: 65,
              min: 16),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: Column(
              children: [
                TenantListingWidget.createSubTitle(
                    text: 'Preferred Occupation', bottom: 16, top: 40),
                ChooseItemWidget(sampleData: DataTest.occupation),
              ],
            ),
          )
        ],
      ),
    );
  }
}
