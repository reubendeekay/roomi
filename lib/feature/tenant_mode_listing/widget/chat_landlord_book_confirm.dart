import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/user_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/book_confirm_widget.dart';
import 'package:roomy/providers/auth_provider.dart';
import 'package:roomy/providers/tenant_provider.dart';

class ChatLandlordBookConfirm extends StatefulWidget {
  const ChatLandlordBookConfirm({this.room});
  final RoomModel room;
  @override
  _ChatLandlordBookConfirmState createState() =>
      _ChatLandlordBookConfirmState();
}

class _ChatLandlordBookConfirmState extends State<ChatLandlordBookConfirm> {
  bool booked = false;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final userImg =
        Provider.of<AuthProvider>(context, listen: false).user.imgAvt;
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          height: booked ? height / 7 * 3.5 : height / 7 * 4,
          width: double.infinity,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        iconSize: 16,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: constraints.maxHeight / 211 * 28,
                        child: BookConfirmWidget.createListAvt(
                            listAvt: [widget.room.user.imgAvt, userImg]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 16),
                            child: SizedBox(
                              height: booked
                                  ? constraints.maxHeight / 29 * 4
                                  : constraints.maxHeight / 211 * 24,
                              child: BookConfirmWidget.createSpecialText(
                                  height: 24,
                                  textAlign: TextAlign.center,
                                  fontSize: 14,
                                  input: booked
                                      ? 'Congratulation! Your room has been successfully booked!'
                                      : 'Book ${widget.room.user.name} room and become their roommate?',
                                  color: booked
                                      ? const Color(0xFF08C299)
                                      : const Color(0xFF020433)),
                            ),
                          ),
                          BookConfirmWidget.createPriceBoard(widget.room.post),
                          booked
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () async {
                                    final uid =
                                        FirebaseAuth.instance.currentUser.uid;
                                    await Provider.of<TenantProvider>(context,
                                            listen: false)
                                        .addTenant(uid, widget.room.post.id);
                                    setState(() {
                                      booked = !booked;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 24),
                                    child: AppWidget.typeButtonStartAction(
                                        input: 'BOOK NOW',
                                        width: constraints.maxWidth - 48,
                                        height: 17.07,
                                        fontSize: 14),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
