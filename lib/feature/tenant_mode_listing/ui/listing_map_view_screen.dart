import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/feature/tenant_mode_listing/model/room_model.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/google_map_widget.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/listing_full_width_widget.dart';
import 'package:roomy/providers/post_provider.dart';
import 'package:marker_icon/marker_icon.dart';

import '../bloc/map_view/bloc_map_view.dart';
import '../data_test.dart';

class ListingMapViewScreen extends StatefulWidget {
  @override
  _ListingMapViewScreenState createState() => _ListingMapViewScreenState();
}

class _ListingMapViewScreenState extends State<ListingMapViewScreen> {
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
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final rooms = Provider.of<PostProvider>(context, listen: false).rooms;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: height / 3 * 2,
            width: double.infinity,
            child: BlocBuilder<MapViewBloc, MapViewState>(
              bloc: BlocProvider.of<MapViewBloc>(context),
              builder: (ctx, state) {
                if (state is MapViewSelectedState) {
                  create(context, rooms.map((e) => e.post.location).toList(),
                      rooms.map((e) => e.post).toList());
                }
                return GoogleMapWidget(
                    width: width,
                    markers: markers,
                    listOfMarker: DataTest.listOfMarker);
              },
            ),
          ),
          SizedBox(
            height: height / 3,
            width: double.infinity,
            child: FutureBuilder<List<RoomModel>>(
                future: Provider.of<PostProvider>(context, listen: false)
                    .fetchRooms(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Card();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    itemBuilder: (context, index) {
                      final post = snapshot.data[index].post;
                      final user = snapshot.data[index].user;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: 220,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 4,
                                    color: current == index
                                        ? const Color(0xFF0F73EE)
                                        : const Color(0xFFFFFFFF),
                                    margin: const EdgeInsets.only(bottom: 4),
                                  ),
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          post.images.first,
                                          height: 128,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 18,
                                        right: 17,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              post.selected = !post.selected;
                                            });
                                          },
                                          child: Image.asset(
                                            post.selected
                                                ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                                                : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                                            width: 22,
                                            height: 20,
                                            color: DataTest.listOfMarker[
                                                    indexSelected]['favored']
                                                ? const Color(0xFFFC2F39)
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: ListingFullWidthWidget
                                        .createInfoPostWidget(
                                            post: post,
                                            hasVerify: true,
                                            sizeBedroom: 10,
                                            heightBedroom: 12.19,
                                            sizeTitle: 14,
                                            heightTitle: 17.07,
                                            sizePrice: 13,
                                            heightPrice: 15.85,
                                            sizeSubInfo: 10,
                                            heightSubInfo: 12.19),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
