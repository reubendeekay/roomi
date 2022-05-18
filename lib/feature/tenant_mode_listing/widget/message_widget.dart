import 'package:bubble/bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/message_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({@required this.message, this.user});
  final MessageModel message;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final uid = FirebaseAuth.instance.currentUser.uid;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: message.senderId == uid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message.senderId != uid
              ? Padding(
                  padding: const EdgeInsets.only(right: 4, bottom: 15),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.network(
                        user.imgAvt,
                        height: 32,
                        width: 32,
                      ),
                      const Positioned(
                        right: -2,
                        bottom: -2,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xFF08C299),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Column(
            crossAxisAlignment: message.senderId == uid
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width / 4 * 2.5,
                child: Bubble(
                  elevation: 0,
                  alignment: message.senderId == uid
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  color: message.senderId == uid
                      ? const Color(0xFF0F73EE)
                      : const Color(0xFFF0F0F0),
                  padding: const BubbleEdges.only(
                      top: 8, bottom: 8, left: 16, right: 16),
                  margin: const BubbleEdges.only(bottom: 4),
                  radius: const Radius.circular(10),
                  nipRadius: 0,
                  nip: message.senderId != uid
                      ? BubbleNip.leftBottom
                      : BubbleNip.rightBottom,
                  child: Text(
                    message.message,
                    style: AppWidget.simpleTextFieldStyle(
                        height: 21,
                        fontSize: 14,
                        color: message.senderId == uid
                            ? Colors.white
                            : const Color(0xFF020433)),
                  ),
                ),
              ),
              Text(
                DateFormat('HH:mm').format(message.sentAt.toDate()),
                style: AppWidget.simpleTextFieldStyle(
                    color: const Color(0xFF95A0B6),
                    height: 12.19,
                    fontSize: 10),
              )
            ],
          ),
        ],
      ),
    );
  }
}
