import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/custom_google_map.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({this.circles, this.zoom});
  final Set<Circle> circles;
  final double zoom;
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              CustomGoogleMap(
                circles: circles,
                zoom: zoom,
              ),
              Positioned(
                top: 54,
                left: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'images/log_in/ic_back@3x.png',
                        height: 18,
                        width: 22,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
