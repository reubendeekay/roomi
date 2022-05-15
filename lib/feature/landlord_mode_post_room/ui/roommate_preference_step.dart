import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/slider_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/segment_control_widget.dart';
import '../ui/form/form_step_three.dart';

class RoommatePreferenceStep extends StatelessWidget {
  const RoommatePreferenceStep(
      {this.rentController, this.depositController, this.dateController});
  final TextEditingController dateController;
  final TextEditingController rentController;
  final TextEditingController depositController;
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
                    inputFirst: 'Room',
                    inputLast: 'Preferences',
                  ),
                ),
                FormStepThree(
                    dateController: dateController,
                    depositController: depositController,
                    rentController: rentController),
                Align(
                    alignment: Alignment.centerLeft,
                    child: LandlordDetailWidget.createText(text: 'Room Type')),
                TenantListingWidget.createSubTitle(
                    text: 'Minimum stay', top: 0, bottom: 0),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: SliderWidget(
                labelOne: 'No minimum',
                labelTwo: 'Over 12 months',
                max: 12,
                min: 0),
          ),
        ],
      ),
    );
  }
}
