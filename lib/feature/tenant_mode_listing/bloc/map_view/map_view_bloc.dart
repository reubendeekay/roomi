import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc_map_view.dart';

class MapViewBloc extends Bloc<MapViewEvent, MapViewState> {
  MapViewBloc() : super(MapViewInitial());
  static final List<Map<String, dynamic>> listOfMarker = [
    <String, dynamic>{
      'id': 1,
      'selected': false,
      'latLng': const LatLng(21.037763, 105.834160),
      'price': '\$650',
      'image': [
        'images/tenant_mode/img_landlord_1@3x.png',
        'images/tenant_mode/img_landlord_1@3x.png',
        'images/tenant_mode/img_landlord_1@3x.png',
        'images/tenant_mode/img_landlord_1@3x.png',
      ],
      'favored': false,
    },
    <String, dynamic>{
      'id': 2,
      'selected': false,
      'latLng': const LatLng(21.047763, 105.834160),
      'price': '\$680',
      'image': [
        'images/tenant_mode/img@3x.png',
        'images/tenant_mode/img@3x.png',
        'images/tenant_mode/img@3x.png',
      ],
      'favored': false,
    },
    <String, dynamic>{
      'id': 3,
      'selected': false,
      'latLng': const LatLng(21.057763, 105.834160),
      'price': '\$690',
      'image': [
        'images/tenant_mode/img_landlord_2@1x.png',
        'images/tenant_mode/img_landlord_2@1x.png',
      ],
      'favored': false,
    },
  ];
  @override
  Stream<MapViewState> mapEventToState(MapViewEvent event) async* {
    if (event is SelectedPlaceEvent) {
      try {
        yield MapViewLoading();
        for (int i = 0; i < listOfMarker.length; i++) {
          if (listOfMarker[i]['id'] == event.id) {
            listOfMarker[i]['selected'] = event.selected;
          } else {
            listOfMarker[i]['selected'] = false;
          }
        }
        yield MapViewSelectedState(listOfMarker: listOfMarker);
      } catch (error) {
        yield MapViewFailure(error: error.toString());
      }
    }
  }
}
