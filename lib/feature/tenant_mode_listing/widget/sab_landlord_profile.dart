import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/filter_widget.dart';

class SabLandlordProfile extends StatefulWidget {
  const SabLandlordProfile({this.height, this.listImage});
  final double height;
  final List<String> listImage;
  @override
  _SabLandlordProfileState createState() => _SabLandlordProfileState();
}

class _SabLandlordProfileState extends State<SabLandlordProfile> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: widget.height / 203 * 70,
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
                child: Image.asset(
                  'images/tenant_mode/ic_menu_white@3x.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
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
              return Image.asset(
                widget.listImage[index],
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
          ),
          Positioned(
              bottom: 44,
              child: FilterWidget.createIndicator(
                  listImage: widget.listImage, currentImage: currentImage)),
          Positioned(
            child: Container(
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
            bottom: -1,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
