import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({this.colorButton});
  final Color colorButton;
  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Container(
      height: 66,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(2, 4, 51, 0.08),
            blurRadius: 4,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              width: 50,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: widget.colorButton,
                  borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                selected
                    ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                    : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                width: 24,
                height: 24,
                color: selected ? const Color(0xFFFC2F39) : Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.chatLandlordScreen);
            },
            child: AppWidget.typeButtonStartAction(
                input: 'REQUEST CHAT', width: width / 3 * 2),
          ),
        ],
      ),
    );
  }
}
