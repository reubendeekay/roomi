import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/choose_item_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/providers/post_provider.dart';

import '../../tenant_mode_listing/data_test.dart';

class RoomPreferenceStep extends StatefulWidget {
  @override
  State<RoomPreferenceStep> createState() => _RoomPreferenceStepState();
}

class _RoomPreferenceStepState extends State<RoomPreferenceStep> {
  String gender, occupation;
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<PostProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
            child: Column(
              children: [
                TenantListingWidget.createSubTitle(
                    text: 'Gender', bottom: 16, top: 40),
                ChooseItemWidget(
                    sampleData: DataTest.gender,
                    type: (val) {
                      setState(() {
                        gender = val;
                      });
                      post.prefferedGender = val;
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: Column(
              children: [
                TenantListingWidget.createSubTitle(
                    text: 'Occupation', bottom: 16, top: 40),
                ChooseItemWidget(
                  sampleData: DataTest.occupation,
                  type: (val) {
                    setState(() {
                      occupation = val;
                    });
                    post.prefferedOccupation = val;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
