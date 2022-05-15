import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';

import '../widget/my_listing_widget.dart';

class MyListingIncomplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return ListPostWidget(
      child: MyListingWidget.createItemIncomplete(width: width),
      listPost: ListOption.listRoomInComplete,
    );
  }
}
