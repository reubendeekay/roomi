import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/chat_landlord_screen.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/providers/chat_provider.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return FutureBuilder<List<ChatTileModel>>(
        future: Provider.of<ChatProvider>(context, listen: false).getChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final docs = snapshot.data;

          return SizedBox(
            width: width,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.only(top: 24, left: 24),
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          List<String> rooms = docs.map<String>((e) {
                            return e.chatRoomId.contains(
                                    FirebaseAuth.instance.currentUser.uid +
                                        '_' +
                                        docs[index].user.id)
                                ? FirebaseAuth.instance.currentUser.uid +
                                    '_' +
                                    docs[index].user.id
                                : docs[index].user.id +
                                    '_' +
                                    FirebaseAuth.instance.currentUser.uid;
                          }).toList();

                          Get.to(() => ChatLandlordScreen(
                                user: docs[index].user,
                                chatRoomId: rooms.isEmpty
                                    ? FirebaseAuth.instance.currentUser.uid +
                                        '_' +
                                        docs[index].user.id
                                    : rooms.first,
                              ));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                      height: 32,
                                      width: 32,
                                      child: Image.network(
                                          docs[index].user.imgAvt)),
                                  Positioned(
                                    top: 0,
                                    left: -10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 8,
                                      width: 8,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(docs[index].user.name,
                                                style: AppWidget
                                                    .boldTextFieldStyle(
                                                        height: 17.07,
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xFF020433),
                                                        fontWeight:
                                                            FontWeight.w500)),
                                            Text(
                                                DateFormat('MMM dd').format(
                                                    docs[index].time.toDate()),
                                                style: AppWidget
                                                    .simpleTextFieldStyle(
                                                        height: 15.85,
                                                        fontSize: 13,
                                                        color: const Color(
                                                            0xFF95A0B6)))
                                          ],
                                        ),
                                        Text(
                                          docs[index].latestMessage,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, bottom: 16),
                                    child: SavedWidget.createLine(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
