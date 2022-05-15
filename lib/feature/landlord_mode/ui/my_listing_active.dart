import 'package:flutter/material.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';

class MyListingActive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPostWidget(
      listPost: ListOption.listRoomActive,
    );
  }
}
