import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/landlord_detail_screen.dart';
import 'package:roomy/providers/post_provider.dart';

import 'item_post.dart';
import 'listing_full_width_widget.dart';
import 'tenant_listing_widget.dart';

class ListPostWidget extends StatelessWidget {
  const ListPostWidget({this.child, this.listPost});
  final Widget child;
  final List<Map<String, dynamic>> listPost;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Container(
      height: height,
      width: double.infinity,
      color: const Color(0xFFF7F9FF),
      child: FutureBuilder<List<RoomModel>>(
          future:
              Provider.of<PostProvider>(context, listen: false).fetchRooms(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      SizedBox(
                        width: width,
                        child: TenantListingWidget.createListTile(
                            imgAvt: snapshot.data[index].user.imgAvt,
                            name: snapshot.data[index].user.name,
                            type: snapshot.data[index].user.isLandlord
                                ? 'Landlord'
                                : 'Tenant',
                            male: snapshot.data[index].user.gender),
                      ),
                      ItemPost(
                        index: index,
                        height: height,
                        post: snapshot.data[index].post,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: child ??
                            GestureDetector(
                              onTap: () {
                                Get.to(() => LandlordDetailScreen(
                                      room: snapshot.data[index],
                                    ));
                              },
                              child:
                                  ListingFullWidthWidget.createInfoPostWidget(
                                hasVerify: true,
                                post: snapshot.data[index].post,
                              ),
                            ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
