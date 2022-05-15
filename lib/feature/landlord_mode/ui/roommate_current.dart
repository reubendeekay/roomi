import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/common/constant/list_option.dart';

class RoommateCurrent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 5),
      itemCount: ListOption.listRoommateCurrent.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TenantListingWidget.createListTile(
                imgAvt: ListOption.listRoommateCurrent[index]['avt'],
                name: ListOption.listRoommateCurrent[index]['name'],
                type: ListOption.listRoommateCurrent[index]['type'],
                age: ListOption.listRoommateCurrent[index]['age'],
                male: ListOption.listRoommateCurrent[index]['male'],
                trailing: const SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 10),
              child: SavedWidget.createLine(),
            )
          ],
        );
      },
    );
  }
}
