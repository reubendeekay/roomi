import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/custom_google_map.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationStep extends StatelessWidget {
  const SelectLocationStep({this.switchStep, this.listMarker});
  final Function(int) switchStep;
  final Set<Marker> listMarker;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomGoogleMap(
            markers: listMarker,
          ),
          Positioned(
            top: 24,
            left: 24,
            right: 24,
            child: AppWidget.createSearchPlace(
                hintText: 'Enter your full address'),
          ),
          Positioned(
            bottom: 4,
            left: 24,
            right: 24,
            child: GestureDetector(
                onTap: () {
                  switchStep(2);
                },
                child:
                    AppWidget.typeButtonStartAction(input: 'CONFIRM ADDRESS')),
          )
        ],
      ),
    );
  }
}
