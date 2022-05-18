import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:readmore/readmore.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/chat_landlord_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/listing_full_width_widget.dart';
import 'package:roomy/providers/chat_provider.dart';

mixin LandlordDetailWidget {
  static Widget createText({String text, double top, double bottom}) {
    return Padding(
      padding: EdgeInsets.only(top: top ?? 0, bottom: bottom ?? 0),
      child: Text(
        text,
        style: AppWidget.simpleTextFieldStyle(
            fontSize: 14, height: 17.07, color: const Color(0xFF020433)),
      ),
    );
  }

  static Widget createLine() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
    );
  }

  static Widget createButtonRequest(
      {BuildContext context,
      String totalMoney,
      String deposit,
      RoomModel room}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'KES$totalMoney',
                      style: AppWidget.boldTextFieldStyle(
                          color: const Color(0xFF020433),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 21.94),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('per month',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF404B69),
                              fontSize: 12,
                              height: 14.63)),
                    ),
                  ],
                ),
                Text('(KES$deposit deposit)',
                    style: AppWidget.simpleTextFieldStyle(
                        color: const Color(0xFF404B69),
                        fontSize: 12,
                        height: 14.63)),
              ],
            ),
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    final users =
                        Provider.of<ChatProvider>(context, listen: false)
                            .contactedUsers;
                    List<String> rooms = users.map<String>((e) {
                      return e.chatRoomId.contains(
                              FirebaseAuth.instance.currentUser.uid +
                                  '_' +
                                  room.user.id)
                          ? FirebaseAuth.instance.currentUser.uid +
                              '_' +
                              room.user.id
                          : room.user.id +
                              '_' +
                              FirebaseAuth.instance.currentUser.uid;
                    }).toList();

                    Get.to(() => ChatLandlordScreen(
                          room: room,
                          chatRoomId: rooms.isEmpty
                              ? FirebaseAuth.instance.currentUser.uid +
                                  '_' +
                                  room.user.id
                              : rooms.first,
                        ));
                  },
                  child:
                      AppWidget.typeButtonStartAction(input: 'REQUEST CHAT'))),
        ],
      ),
    );
  }

  static Widget createReadMore({String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: ReadMoreText(
        text,
        trimLines: 3,
        colorClickableText: const Color(0xFF0F73EE),
        trimMode: TrimMode.Line,
        style: AppWidget.simpleTextFieldStyle(
            fontSize: 14, height: 24, color: const Color(0xFF020433)),
        trimCollapsedText: 'Read more',
        trimExpandedText: 'Show less',
      ),
    );
  }

  static Widget createTitleRoom(
      {List<Map<String, dynamic>> summary,
      String title,
      String totalMoney,
      String deposit}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'images/tenant_mode/ic_verified@3x.png',
                width: 16,
                height: 16,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: ListingFullWidthWidget.createText(
                      input: 'VERIFIED',
                      fontSize: 10,
                      height: 12.19,
                      color: const Color(0xFF08C299))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Text(
              title,
              style: AppWidget.boldTextFieldStyle(
                  color: const Color(0xFF020433),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  height: 34),
            ),
          ),
          Row(
            children: [
              Text(
                'KES$totalMoney',
                style: AppWidget.boldTextFieldStyle(
                    color: const Color(0xFF020433),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 29.26),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 8),
                child: Text('per month',
                    style: AppWidget.simpleTextFieldStyle(
                        color: const Color(0xFF020433),
                        fontSize: 12,
                        height: 17.07)),
              ),
            ],
          ),
          GridView.builder(
            padding: const EdgeInsets.only(top: 32, bottom: 33),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4, crossAxisCount: 2),
            itemCount: summary.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(
                    'images/tenant_mode/${summary[index]['icon']}',
                    height: 16,
                    width: 16,
                    color: const Color(0xFF020433),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        summary[index]['title'],
                        style: AppWidget.simpleTextFieldStyle(
                            color: const Color(0xFF020433),
                            fontSize: 14,
                            height: 17.07),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
