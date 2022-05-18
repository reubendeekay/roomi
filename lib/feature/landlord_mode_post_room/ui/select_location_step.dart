import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roomy/providers/location_provider.dart';

class SelectLocationStep extends StatelessWidget {
  const SelectLocationStep({this.switchStep, this.onLocation});
  final Function(int) switchStep;
  final Function(LatLng) onLocation;
  @override
  Widget build(BuildContext context) {
    final loc =
        Provider.of<LocationProvider>(context, listen: false).locationData;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            onTap: (val) {
              onLocation(val);

              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        content: const Text('The location has been set'),
                        actions: [
                          FlatButton(
                            child: const Text('Confirm Location'),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              switchStep(2);
                            },
                          )
                        ],
                      ));
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(loc.latitude, loc.longitude), zoom: 15),
          ),
        ],
      ),
    );
  }
}
