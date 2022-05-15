import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget(
      {this.height, this.width, this.top, this.bottom, this.left, this.right,this.radius});
  final double height;
  final double width;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF0F0F0),
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(radius ?? 0)
        ),
        margin: EdgeInsets.only(
            top: top ?? 0,
            bottom: bottom ?? 0,
            left: left ?? 0,
            right: right ?? 0),

        height: height,
        width: width,
      ),
    );
  }
}
