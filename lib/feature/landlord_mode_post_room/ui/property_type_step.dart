import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/widget/set_up_step_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/choose_item_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_option_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/segment_control_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/providers/post_provider.dart';

import '../../tenant_mode_listing/data_test.dart';
import '../widget/landlord_mode_widget.dart';

class PropertyTypeStep extends StatefulWidget {
  @override
  State<PropertyTypeStep> createState() => _PropertyTypeStepState();
}

class _PropertyTypeStepState extends State<PropertyTypeStep> {
  String type;
  int numBed, numBath;
  List<String> ammenities, rules;
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final post = Provider.of<PostProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SetUpStepWidget.createTitleWidget(
                  inputFirst: 'About',
                  inputLast: 'The Property',
                ),
                LandlordModeWidget.createSubText(
                    text: 'Total number of bedrooms', top: 16, bottom: 16),
                SegmentControlWidget(
                    width: width,
                    length: 5,
                    onChanged: (value) {
                      setState(() {
                        numBed = value;
                      });
                      post.amountBed = value;
                      print(post.amountBed);
                    }),
                LandlordModeWidget.createSubText(
                    text: 'Total number of bathrooms', top: 24, bottom: 16),
                SegmentControlWidget(
                  width: width,
                  length: 5,
                  onChanged: (val) {
                    setState(() {
                      numBath = val;
                    });
                    post.amountBath = val;
                    print(post.amountBath);
                  },
                ),
                TenantListingWidget.createSubTitle(
                    text: 'Bedroom Type', bottom: 16, top: 40),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ChooseItemWidget(
            sampleData: DataTest.bedroomType,
            type: (val) {
              setState(() {
                type = val;
              });
              post.type = val;
              print(post.type);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TenantListingWidget.createSubTitle(
                    text: 'Property Amenities', bottom: 16),
                ListOptionWidget(
                    sampleData: DataTest.listAmenitiesModel,
                    onSelected: (val) {
                      setState(() {
                        ammenities = val;
                      });
                      post.ammenities = val;
                      print(post.ammenities);
                    }),
                TenantListingWidget.createSubTitle(
                    text: 'Rules', top: 40, bottom: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ListOptionWidget(
                    sampleData: DataTest.listRulesModel,
                    onSelected: (val) {
                      setState(() {
                        rules = val;
                      });
                      post.rules = val;
                      print(rules);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
