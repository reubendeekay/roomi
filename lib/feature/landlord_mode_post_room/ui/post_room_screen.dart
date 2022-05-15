import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/feature/landlord_mode_post_room/bloc/roommate_preference/bloc_roommate_preference.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roomy/feature/tenant_mode_listing/model/post_model.dart';
import 'package:roomy/providers/post_provider.dart';

import '../widget/landlord_mode_widget.dart';
import 'add_photo_step.dart';
import 'property_type_step.dart';
import 'room_preference_step.dart';
import 'roommate_preference_step.dart';
import 'select_location_step.dart';
import 'summary_room_step.dart';

class PostRoomScreen extends StatefulWidget {
  @override
  _PostRoomScreenState createState() => _PostRoomScreenState();
}

class _PostRoomScreenState extends State<PostRoomScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController depositController = TextEditingController();

  bool checkState = false;

  bool selected;
  String ownerId;
  int currentImage;
  bool isFurnished;
  String type;

  List<String> ammenities = [];
  List<String> rules = [];

  int _currentStep = 1;
  Set<Marker> listMarker = <Marker>{};
  BitmapDescriptor myIcon;

  void switchStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final ByteData data = await rootBundle.load(path);
    final Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    final FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    getBytesFromAsset('images/landlord_mode/ic_pin_on_map@3x.png', 70)
        .then((onValue) {
      myIcon = BitmapDescriptor.fromBytes(onValue);
      final marker = Marker(
          position: const LatLng(21.037763, 105.834160),
          icon: myIcon,
          markerId: MarkerId('my location'));
      setState(() {
        listMarker.add(marker);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final post = Provider.of<PostProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 203 * 11),
        child: LandlordModeWidget.createAppBar(
            context: context,
            switchStep: switchStep,
            currentStep: _currentStep),
      ),
      body: IndexedStack(
        index: _currentStep - 1,
        children: [
          SelectLocationStep(
            switchStep: switchStep,
            listMarker: listMarker,
          ),
          PropertyTypeStep(),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: RoommatePreferenceStep(
                dateController: dateController,
                depositController: depositController,
                rentController: rentController),
          ),
          RoomPreferenceStep(),
          SummaryRoomStep(),
          GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: AddPhotoStep()),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: _currentStep - 1 != 0 ? 66 : 0,
          child: IndexedStack(
            index: _currentStep - 1,
            children: [
              const SizedBox(),
              LandlordModeWidget.createContainerNav(
                  input: 'NEXT',
                  switchStep: switchStep,
                  step: 3,
                  hasShadow: false),
              Container(
                height: 66,
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 4),
                child: BlocListener<RoommatePrfBloc, RoommatePrfState>(
                  listener: (context, state) {
                    if (state is RoommatePrfSuccess) {
                      checkState = true;
                    }
                  },
                  child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (checkState) {
                          switchStep(4);
                        } else {
                          BlocProvider.of<RoommatePrfBloc>(context).add(
                              NextButtonPressed(
                                  rent: rentController.text,
                                  deposit: depositController.text,
                                  available: dateController.text));
                        }
                      },
                      child: AppWidget.typeButtonStartAction(input: 'NEXT')),
                ),
              ),
              LandlordModeWidget.createContainerNav(
                  input: 'NEXT',
                  switchStep: switchStep,
                  step: 5,
                  hasShadow: true),
              LandlordModeWidget.createContainerNav(
                  input: 'NEXT',
                  switchStep: switchStep,
                  step: 6,
                  hasShadow: true),
              LandlordModeWidget.createContainerNav(
                  input: 'PREVIEW ',
                  context: context,
                  // route: Routes.previewPostScreen,
                  onTap: () async {
                    final room = PostModel(
                      description: post.description,
                      deposit: depositController.text,
                      createdAt: Timestamp.now(),
                      images: [],
                      location: GeoPoint(21.037763, 105.834160),
                      rentAmount: rentController.text,
                      rules: post.rules,
                      title: post.title,
                      ammenities: post.ammenities,
                      amountBath: post.amountBath,
                      amountBed: post.amountBed,
                      prefferedGender: post.prefferedGender,
                      prefferedOccupation: post.prefferedOccupation,
                      timeRent: '12',
                      state: 'Available',
                      type: post.type,
                      prefferedAge: '20',
                      ownerId: FirebaseAuth.instance.currentUser.uid,
                    );

                    await post.postRoom(room);
                    print(room.toJson());
                    Navigator.of(context).pushNamed(Routes.previewPostScreen);
                  },
                  hasShadow: true),
            ],
          ),
        ),
      ),
    );
  }
}
