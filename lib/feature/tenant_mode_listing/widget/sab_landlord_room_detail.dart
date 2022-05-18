import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:roomy/common/route/routes.dart';
import 'package:roomy/providers/auth_provider.dart';
import 'package:roomy/providers/wishlist_provider.dart';

class AppBarLandlordRoomDetail extends StatefulWidget {
  const AppBarLandlordRoomDetail(
      {this.height, this.listImage, @required this.id});
  final List<dynamic> listImage;
  final double height;
  final String id;
  @override
  _AppBarLandlordRoomDetailState createState() =>
      _AppBarLandlordRoomDetailState();
}

class _AppBarLandlordRoomDetailState extends State<AppBarLandlordRoomDetail> {
  int currentImage = 0;
  bool selected = false;
  bool isLiked() {
    final userRef = Provider.of<AuthProvider>(context, listen: false).user;

    return userRef.wishlist.contains(widget.id);
  }

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
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                    Provider.of<WishlistProvider>(context, listen: false)
                        .addToWishList(widget.id, isLiked());
                  },
                  child: Image.asset(
                    selected || isLiked()
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
        ],
      ),
    );
  }
}
