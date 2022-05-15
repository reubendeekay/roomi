import 'package:flutter/material.dart';

import 'listing_full_width_widget.dart';

class SimilarListingWidget extends StatefulWidget {
  const SimilarListingWidget({this.similarList, this.hasVerify});
  final List<Map<String, dynamic>> similarList;
  final bool hasVerify;
  @override
  _SimilarListingWidgetState createState() => _SimilarListingWidgetState();
}

class _SimilarListingWidgetState extends State<SimilarListingWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: widget.similarList.length,
        padding: const EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            widget.similarList[index]['img'],
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
                                widget.similarList[index]['favored'] =
                                    !widget.similarList[index]['favored'];
                              });
                            },
                            child: Image.asset(
                              widget.similarList[index]['favored']
                                  ? 'images/tenant_mode/ic_wishlist_active@3x.png'
                                  : 'images/tenant_mode/ic_tab_bookmark@3x.png',
                              width: 22,
                              height: 20,
                              color: widget.similarList[index]['favored']
                                  ? const Color(0xFFFC2F39)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListingFullWidthWidget.createInfoPostWidget(
                          hasVerify: widget.hasVerify ?? true,
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
          );
        },
      ),
    );
  }
}
