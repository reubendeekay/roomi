import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomInfoWindow {
  static Future<BitmapDescriptor> customInfoWindow(
      {double width,
      double height,
      double fontSize,
      String price,
      Color backgroundColor,
      Color text}) async {
    final PictureRecorder recorder = PictureRecorder();
    final Canvas c = Canvas(recorder);
    final path = Path();
    path.lineTo(0.0, height - 30);

    path.quadraticBezierTo(0.0, height - 25, 5.0, height - 25);
    path.lineTo(width - 5.0, height - 25);

    path.lineTo((width / 2) - 8, height - 25);
    path.lineTo(width / 2, height - 15);
    path.lineTo((width / 2) + 8, height - 25);
    path.lineTo(width - 5, height - 25);

    path.quadraticBezierTo(width, height - 25, width, height - 30);

    path.lineTo(width, 5.0);
    path.quadraticBezierTo(width, 0.0, width - 5.0, 0.0);
    path.lineTo(5.0, 0.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 5.0);
    final Paint paint = Paint()..color = backgroundColor;

    c.drawPath(path, paint);

    final span = TextSpan(
        style: AppWidget.boldTextFieldStyle(
            fontSize: fontSize,
            height: 17.07,
            color: text,
            fontWeight: FontWeight.w700),
        text: price);

    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(c, Offset(width / 8, height / 4));

    final Picture p = recorder.endRecording();
    final ByteData pngBytes =
        await (await p.toImage(tp.width.toInt() + 70, tp.height.toInt() + 60))
            .toByteData(format: ImageByteFormat.png);

    final Uint8List data = Uint8List.view(pngBytes.buffer);

    return BitmapDescriptor.fromBytes(data);
  }
}
