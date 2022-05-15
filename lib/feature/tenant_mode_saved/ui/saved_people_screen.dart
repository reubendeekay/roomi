import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';

class SavedPeopleScreen extends StatefulWidget {
  @override
  _SavedPeopleScreenState createState() => _SavedPeopleScreenState();
}

class _SavedPeopleScreenState extends State<SavedPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 5),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TenantListingWidget.createListTile(
                imgAvt: 'images/tenant_mode/img_avatar@3x.png',
                name: 'Susie Jenkins',
                type: 'Roommate',
                age: 25,
                male: false,
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
