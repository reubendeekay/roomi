import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/tenant_listing_widget.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/providers/tenant_provider.dart';

class RoommateCurrent extends StatelessWidget {
  const RoommateCurrent({Key key, @required this.user}) : super(key: key);

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TenantModel>>(
        future: Provider.of<TenantProvider>(context, listen: false)
            .getTenants(user),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.only(top: 5),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final tenant = snapshot.data[index];
              return Column(
                children: [
                  TenantListingWidget.createListTile(
                      imgAvt: tenant.user.imgAvt,
                      name: tenant.user.name,
                      type: tenant.user.email,
                      age: tenant.user.age,
                      male: tenant.user.gender,
                      trailing: const SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 10),
                    child: SavedWidget.createLine(),
                  )
                ],
              );
            },
          );
        });
  }
}
