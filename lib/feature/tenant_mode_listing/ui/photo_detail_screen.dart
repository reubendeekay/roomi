import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/photo_detail/bloc_photo_detail.dart';

class PhotoDetailScreen extends StatefulWidget {
  @override
  _PhotoDetailScreenState createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  String image;
  int currentIndex;
  List<String> listPhoto = [
    'images/tenant_mode/img@3x.png',
    'images/tenant_mode/img_photo_detail@3x.png',
    'images/tenant_mode/img_photo_detail_2@3x.png',
    'images/tenant_mode/img_roommate_2@3x.png'
  ];

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF020433),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Image.asset(
                    'images/questionnaires/ic_back@3x.png',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: BlocBuilder<PhotoDetailBloc, PhotoDetailState>(
            bloc: BlocProvider.of<PhotoDetailBloc>(context),
            builder: (context, state) {
              if (state is ImageSelectedInitial) {
                image = state.imageSelected;
                currentIndex = state.index;
              }
              if (state is ImageSelectedState) {
                image = state.imageSelected;
                currentIndex = state.index;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(image,
                      height: height / 203 * 75,
                      width: width,
                      fit: BoxFit.fill),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 60),
                          child: Text(
                            '$currentIndex/${listPhoto.length}',
                            style: AppWidget.simpleTextFieldStyle(
                                color: Colors.white, height: 24, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 24),
                          child: Text(
                            'Bathroom with my cat',
                            style: AppWidget.simpleTextFieldStyle(
                                color: Colors.white, height: 24, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: height / 203 * 20,
                          width: width,
                          child: ListView.builder(
                            itemCount: listPhoto.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<PhotoDetailBloc>(
                                                context)
                                            .add(ImageSelectedEvent(
                                                indexItemSelected: index,
                                                listImage: listPhoto));
                                      },
                                      child: Container(
                                        height: height / 203 * 20,
                                        width: width / 3,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: currentIndex - 1 == index
                                                    ? 2
                                                    : 0,
                                                color: Colors.white)),
                                        child: Image.asset(listPhoto[index],
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
