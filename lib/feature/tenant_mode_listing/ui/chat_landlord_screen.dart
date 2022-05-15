import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/chat_landlord_book_confirm.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/chat_landlord_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/message_widget.dart';

import '../data_test.dart';

class ChatLandlordScreen extends StatefulWidget {
  ChatLandlordScreen({this.room});
  final RoomModel room;
  @override
  _ChatLandlordScreenState createState() => _ChatLandlordScreenState();
}

class _ChatLandlordScreenState extends State<ChatLandlordScreen> {
  TextEditingController message = TextEditingController();
  void sendMessage() {
    if (message.text.isNotEmpty) {
      message.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: ChatLandlordWidget.createAppBar(
          context: context, user: widget.room.user),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 12),
            decoration:
                const BoxDecoration(color: Color(0xFFF7F9FF), boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  color: Color.fromRGBO(2, 4, 51, 0.08),
                  blurRadius: 4)
            ]),
            child: Row(
              children: [
                SizedBox(
                  width: (width - 48) / 3 * 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.room.post.title,
                        style: AppWidget.boldTextFieldStyle(
                            fontSize: 13,
                            height: 15.85,
                            color: const Color(0xFF020433),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'KES${widget.room.post.rentAmount} per month',
                        style: AppWidget.simpleTextFieldStyle(
                            fontSize: 12,
                            height: 14.63,
                            color: const Color(0xFF020433)),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog<dynamic>(
                      context: context,
                      builder: (context) {
                        return ChatLandlordBookConfirm(room: widget.room);
                      },
                    );
                  },
                  child: AppWidget.typeButtonStartAction(
                      input: 'BOOK NOW',
                      width: (width - 48) / 3,
                      padTop: 12,
                      padBottom: 13,
                      fontSize: 13),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
              physics: const ScrollPhysics(),
              itemCount: DataTest.listMessage.length,
              itemBuilder: (context, index) {
                return MessageWidget(
                  message: DataTest.listMessage[index],
                  user: widget.room.user,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 24, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: width / 3 * 2,
                      child: TextField(
                        controller: message,
                        style: AppWidget.simpleTextFieldStyle(
                            color: const Color(0xFF020433),
                            fontSize: 14,
                            height: 21),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Write a message',
                            hintStyle: AppWidget.simpleTextFieldStyle(
                                color: const Color(0xFF95A0B6),
                                fontSize: 14,
                                height: 17.07),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ChatLandlordWidget.createAction(
                          'images/tenant_mode/ic_chat_add@3x.png'),
                      GestureDetector(
                        onTap: () {
                          sendMessage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: ChatLandlordWidget.createAction(
                              'images/tenant_mode/ic_send@3x.png'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
