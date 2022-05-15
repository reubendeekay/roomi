import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/filter_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_option_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/slider_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/segment_control_widget.dart';
import 'package:roomy/common/widget/text_field_date.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/landlord_detail_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/choose_item_widget.dart';
import 'package:roomy/feature/landlord_mode_post_room/widget/landlord_mode_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';
import '../data_test.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController dateController = TextEditingController();
  FocusNode focusDate = FocusNode();
  List<OptionModel> listSelectedAmen = [];
  List<OptionModel> listSelectedRule = [];
  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: FilterWidget.createAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  FilterWidget.createTitle(
                      text: 'Sharing with', top: 20, bottom: 32),
                  ChooseItemWidget(
                    sampleData: DataTest.sharingWith,
                  ),
                  TenantListingWidget.createSubTitle(
                      text: 'Gender', top: 40, bottom: 16),
                  ChooseItemWidget(
                    sampleData: DataTest.gender,
                  ),
                  TenantListingWidget.createSubTitle(
                      text: 'Age', top: 40, bottom: 0),
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
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  TenantListingWidget.createSubTitle(
                      text: 'Occupation', top: 40, bottom: 16),
                  ChooseItemWidget(
                    sampleData: DataTest.occupation,
                  ),
                  FilterWidget.createTitle(
                      text: 'About Room', top: 56, bottom: 32),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: LandlordDetailWidget.createText(text: 'Sort By')),
                  Padding(
                    padding: const EdgeInsets.only(top: 17, bottom: 40),
                    child: SegmentControlWidget(
                      width: width,
                      listLabel: const ['Best Match', 'Price', 'Recent'],
                    ),
                  ),
                  TenantListingWidget.createSubTitle(
                      text: 'Monthly Budgets', top: 0, bottom: 0),
                ],
              ),
            ),
            const SliderWidget(
                typeLabel: 'monthlyBudgets',
                labelOne: '\$0',
                labelTwo: '\$5,000',
                max: 5000,
                min: 0),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  TenantListingWidget.createSubTitle(
                      text: 'Bedroom Type', top: 40, bottom: 16),
                  ChooseItemWidget(
                    sampleData: DataTest.bedroomType,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 40),
                      child: TextFieldDate(
                        input: 'Move-in Date',
                        focusNode: focusDate,
                        controller: dateController,
                      )),
                  TenantListingWidget.createSubTitle(
                      text: 'Duration', top: 0, bottom: 0),
                ],
              ),
            ),
            const SliderWidget(
                typeLabel: 'duration',
                labelOne: '0 months',
                labelTwo: 'Over 1 year',
                max: 12,
                min: 0),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  TenantListingWidget.createSubTitle(
                      text: 'Amenities', top: 40, bottom: 16),
                  ListOptionWidget(
                    sampleData: DataTest.listAmenitiesModel,
                    listSelected: listSelectedAmen,
                  ),
                  TenantListingWidget.createSubTitle(
                      text: 'Rules', top: 40, bottom: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ListOptionWidget(
                      sampleData: DataTest.listRulesModel,
                      listSelected: listSelectedRule,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: LandlordModeWidget.createContainerNav(
            input: 'SEE 100+ MATCH', context: context, hasShadow: true),
      ),
    );
  }
}
