import 'package:flutter/material.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_notification/ui/message_screen.dart';

class BookingSent extends StatelessWidget {
  const BookingSent({this.listBookSent});
  final List<Map<String, dynamic>> listBookSent;
  @override
  Widget build(BuildContext context) {
    return MessageScreen();
  }
}
