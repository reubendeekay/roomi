import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({this.message, this.user});
  final Map<String, dynamic> message;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: message['sender'] == 'me'
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message['sender'] == 'you'
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
            crossAxisAlignment: message['sender'] == 'me'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width / 4 * 2.5,
                child: Bubble(
                  elevation: 0,
                  alignment: message['sender'] == 'me'
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  color: message['sender'] == 'me'
                      ? const Color(0xFF0F73EE)
                      : const Color(0xFFF0F0F0),
                  padding: const BubbleEdges.only(
                      top: 8, bottom: 8, left: 16, right: 16),
                  margin: const BubbleEdges.only(bottom: 4),
                  radius: const Radius.circular(10),
                  nipRadius: 0,
                  nip: message['sender'] == 'you'
                      ? BubbleNip.leftBottom
                      : BubbleNip.rightBottom,
                  child: Text(
                    message['message'],
                    style: AppWidget.simpleTextFieldStyle(
                        height: 21,
                        fontSize: 14,
                        color: message['sender'] == 'me'
                            ? Colors.white
                            : const Color(0xFF020433)),
                  ),
                ),
              ),
              Text(
                message['time'],
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
