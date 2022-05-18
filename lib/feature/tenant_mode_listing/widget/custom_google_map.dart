import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roomy/providers/location_provider.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap(
      {this.markers, this.circles, this.zoom, this.zoomGesturesEnabled, b});
  final Set<Marker> markers;
  final Set<Circle> circles;
  final double zoom;
  final bool zoomGesturesEnabled;
  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  String mapStyle;

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString('images/style_map/style.json')
        .then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loc =
        Provider.of<LocationProvider>(context, listen: false).locationData;
    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      markers: widget.markers ?? const <Marker>{},
      myLocationEnabled: true,
      zoomGesturesEnabled: widget.zoomGesturesEnabled ?? true,
      circles: widget.circles ?? const <Circle>{},
      onMapCreated: (controller) {
        controller.setMapStyle(mapStyle);
      },
      initialCameraPosition: CameraPosition(
          target: LatLng(loc.latitude, loc.longitude), zoom: widget.zoom ?? 13),
    );
  }
}
