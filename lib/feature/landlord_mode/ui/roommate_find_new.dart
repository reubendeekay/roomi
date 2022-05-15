import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/list_post_widget.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/listing_full_width_widget.dart';
import 'package:roomy/common/route/routes.dart';
import 'find_new_detail_screen.dart';

class RoommateFindNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPostWidget(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.findNewDetailScreen,
                arguments: FindNewDetailScreen(
                  infoFindNewDetail: ListOption.infoFindNewDetail,
                ));
          },
          child: ListingFullWidthWidget.createInfoPostWidget(
            hasVerify: true,
          )),
      listPost: ListOption.listRoommateFindNew,
    );
  }
}
