import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'custom_google_map.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({this.width, this.listOfMarker, this.markers});
  final double width;
  final Set<Marker> markers;
  final List<Map<String, dynamic>> listOfMarker;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomGoogleMap(
          markers: markers,
          listOfMarker: listOfMarker,
        ),
        Positioned(
          top: 60,
          left: 24,
          right: 24,
          child: AppWidget.createSearchPlace(hintText: 'Search Place…'),
        ),
        Positioned(
          bottom: 24,
          left: 24,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      blurRadius: 10,
                      offset: Offset(0, 5))
                ]),
            child: IconButton(
              iconSize: 24,
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          child: Container(
            height: 42,
            width: 93,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.14),
                      blurRadius: 8,
                      offset: Offset(0, 4))
                ]),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.filterScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      'Filter',
                      style: AppWidget.boldTextFieldStyle(
                          color: const Color(0xFF020433),
                          height: 17.07,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Image.asset(
                    'images/tenant_mode/ic_filter@3x.png',
                    height: 16,
                    width: 16,
                    fit: BoxFit.cover,
                    color: const Color(0xFF020433),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
