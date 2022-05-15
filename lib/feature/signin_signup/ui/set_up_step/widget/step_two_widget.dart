import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class StepTwoWidget {
  static Widget createItemStepTwo({Map<String, String> city}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(city['image'], fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 4),
          child: FittedBox(
            child: Text(
              city['title'],
              style: AppWidget.boldTextFieldStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF020433),
                  height: 19.5),
            ),
          ),
        ),
        Text(
          city['subTitle'],
          style: AppWidget.simpleTextFieldStyle(
              fontSize: 12, color: const Color(0xFF404B69), height: 14.63),
        )
      ],
    );
  }
}
