import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/shimmer_widget.dart';

mixin ListingFullWidthWidget {
  static Widget createText(
      {String input, Color color, double fontSize, double height}) {
    return Text(
      input,
      style: AppWidget.simpleTextFieldStyle(
          color: color ?? const Color(0xFF020433),
          fontSize: fontSize ?? 13,
          height: height ?? 15.85),
    );
  }

  static Widget createDot({double fontSize, double height}) {
    return Text(
      '·',
      style: AppWidget.boldTextFieldStyle(
          color: const Color.fromRGBO(64, 75, 105, 0.5),
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 17.07),
    );
  }

  static Widget createInfoPostWidget(
      {bool hasVerify,
      double sizeBedroom,
      double heightBedroom,
      double sizeTitle,
      double heightTitle,
      double sizePrice,
      double heightPrice,
      PostModel post,
      double sizeSubInfo,
      double heightSubInfo}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasVerify
            ? Row(
                children: [
                  Image.asset(
                    'images/tenant_mode/ic_verified@3x.png',
                    width: 16,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: createText(
                          input: 'VERIFIED',
                          fontSize: sizeBedroom ?? 10,
                          color: const Color(0xFF08C299),
                          height: heightBedroom ?? 12.19)),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: createDot(fontSize: 14, height: 17.07),
                  ),
                  createText(
                      input:
                          post != null ? post.amountBed.toString() : '2 BEDS',
                      fontSize: sizeBedroom ?? 10,
                      color: const Color(0xFF08C299),
                      height: heightBedroom ?? 12.19)
                ],
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(
            post != null ? post.title : 'Nice Double Room with Own Bathroom',
            style: AppWidget.boldTextFieldStyle(
                color: const Color(0xFF020433),
                fontWeight: FontWeight.w700,
                fontSize: sizeTitle ?? 18,
                height: heightTitle ?? 21.94),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: createText(
                      input: 'KES ${post != null ? post.rentAmount : 650}',
                      fontSize: sizePrice ?? 14,
                      height: heightPrice ?? 17.07),
                ),
                createText(
                    input: 'per month',
                    fontSize: sizePrice ?? 14,
                    height: heightPrice ?? 17.07),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  createText(
                      input: post != null ? post.state : 'Available Now',
                      fontSize: sizeSubInfo ?? 13,
                      height: heightSubInfo ?? 15.85),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: createDot(fontSize: 18, height: 21.94),
                  ),
                  createText(
                      input: post != null
                          ? post.timeRent + 'month lease'
                          : '12 month lease',
                      fontSize: sizeSubInfo ?? 13,
                      height: heightSubInfo ?? 15.85),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  static Widget createInfoPostLoading() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidget(
              width: constraints.maxWidth / 2.2,
              height: 14,
              bottom: 8,
              top: 16,
            ),
            ShimmerWidget(
              width: constraints.maxWidth,
              height: 20,
            ),
            ShimmerWidget(
              width: constraints.maxWidth / 4 * 3,
              height: 20,
              top: 4,
            ),
            ShimmerWidget(
              width: constraints.maxWidth / 2.2,
              height: 18,
              top: 4,
            ),
            ShimmerWidget(
              width: constraints.maxWidth / 1.7,
              height: 16,
              top: 4,
            )
          ],
        );
      },
    );
  }
}
