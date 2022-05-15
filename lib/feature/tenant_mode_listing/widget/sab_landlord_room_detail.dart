import 'package:flutter/material.dart';
import 'package:roomy/common/route/routes.dart';

import 'filter_widget.dart';

class AppBarLandlordRoomDetail extends StatefulWidget {
  const AppBarLandlordRoomDetail({this.height, this.listImage});
  final List<dynamic> listImage;
  final double height;
  @override
  _AppBarLandlordRoomDetailState createState() =>
      _AppBarLandlordRoomDetailState();
}

class _AppBarLandlordRoomDetailState extends State<AppBarLandlordRoomDetail> {
  int currentImage = 0;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: widget.height / 203 * 75,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: InkWell(
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/tenant_mode/ic_share_white@3x.png',
                width: 24,
                height: 24,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Image.asset(
                    selected
                        ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                        : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                    width: 24,
                    height: 24,
                    color: selected ? const Color(0xFFFC2F39) : Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            itemCount: widget.listImage.length,
            onPageChanged: (value) {
              setState(() {
                currentImage = value;
              });
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.photoDetailScreen);
                },
                child: Image.network(
                  widget.listImage[index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          Positioned(
              bottom: 16,
              child: FilterWidget.createIndicator(
                  listImage: widget.listImage, currentImage: currentImage)),
        ],
      ),
    );
  }
}
