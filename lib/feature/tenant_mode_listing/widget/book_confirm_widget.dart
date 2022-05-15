import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';

mixin BookConfirmWidget {
  static Widget createSpecialText(
      {String input,
      Color color,
      double fontSize,
      double height,
      TextAlign textAlign,
      FontWeight fontWeight}) {
    return Text(
      input,
      textAlign: textAlign ?? TextAlign.start,
      style: AppWidget.boldTextFieldStyle(
          color: color ?? const Color(0xFF020433),
          fontSize: fontSize ?? 13,
          height: height ?? 15.85,
          fontWeight: fontWeight ?? FontWeight.w700),
    );
  }

  static Widget createText({String input}) {
    return FittedBox(
      child: Text(
        input,
        style: AppWidget.simpleTextFieldStyle(
            color: const Color(0xFF404B69), fontSize: 13, height: 15.85),
      ),
    );
  }

  static Widget createListAvt({List<String> listAvt}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listAvt.length,
        itemBuilder: (context, index) {
          return Align(
            widthFactor: 0.8,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Image.network(listAvt[index]),
              ),
            ),
          );
        });
  }

  static Widget createPriceBoard(PostModel post) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          color: const Color(0xFFF7F9FF),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createText(input: 'Booking amount'),
              FittedBox(
                  child: createSpecialText(input: 'KES ${post.rentAmount}'))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createText(input: 'Service free'),
                FittedBox(
                    child: createSpecialText(
                        input: 'Free', color: const Color(0xFF0F73EE)))
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: createSpecialText(
                    input: 'Booking amount',
                    color: const Color(0xFF404B69),
                    fontWeight: FontWeight.w500),
              ),
              FittedBox(
                  child: createSpecialText(
                      input: 'KES ${post.rentAmount}',
                      height: 19.5,
                      fontSize: 16))
            ],
          )
        ],
      ),
    );
  }
}
