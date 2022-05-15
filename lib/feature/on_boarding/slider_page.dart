import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:roomy/app/widget_support.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({this.title, this.description, this.image});
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(image,
                  height: constraints.maxHeight * 0.8,
                  width: constraints.maxWidth,
                  fit: BoxFit.fill),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppWidget.boldTextFieldStyle(
                          fontSize: 23,
                          color: const Color(0xFF020433),
                          fontWeight: FontWeight.w700,
                          height: 29.26),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 28, right: 28),
                    child: Text(
                      description,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: AppWidget.simpleTextFieldStyle(
                          fontSize: 14,
                          color: const Color(0xFF404B69),
                          height: 24),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
