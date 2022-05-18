import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marker_icon/marker_icon.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/providers/post_provider.dart';
import 'custom_google_map.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({
    this.width,
  });
  final double width;

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  Set<Marker> markers = <Marker>{};
  int current = 0;
  int indexSelected = 0;

  Future<void> create(BuildContext context, List<GeoPoint> listOfMarker,
      List<PostModel> posts) async {
    for (int i = 0; i < listOfMarker.length; i++) {
      markers.add(Marker(
          markerId: MarkerId('$i'),
          position: LatLng(listOfMarker[i].latitude, listOfMarker[i].longitude),
          icon: await MarkerIcon.downloadResizePictureCircle(
            posts[i].images.first,
            size: 120,
            borderSize: 10,
            addBorder: true,
          )));
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final rooms = Provider.of<PostProvider>(context, listen: false).rooms;

      create(context, rooms.map((e) => e.post.location).toList(),
          rooms.map((e) => e.post).toList());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomGoogleMap(
          markers: markers,
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
