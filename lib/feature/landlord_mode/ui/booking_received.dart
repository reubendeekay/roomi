import 'package:flutter/material.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_notification/ui/message_screen.dart';

class BookingReceived extends StatelessWidget {
  const BookingReceived({this.listBookReceived});
  final List<Map<String, dynamic>> listBookReceived;
  @override
  Widget build(BuildContext context) {
    return MessageScreen(
      listMessNotify: ListOption.listBookReceived,
    );
  }
}
