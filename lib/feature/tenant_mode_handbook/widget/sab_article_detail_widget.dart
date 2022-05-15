import 'package:flutter/material.dart';

class SabArticleDetailWidget extends StatefulWidget {
  const SabArticleDetailWidget({this.tag, this.height});
  final String tag;
  final double height;
  @override
  _SabArticleDetailWidgetState createState() => _SabArticleDetailWidgetState();
}

class _SabArticleDetailWidgetState extends State<SabArticleDetailWidget> {
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
      flexibleSpace: Image.asset(
        widget.tag,
        width: double.infinity,
        height: widget.height / 203 * 75,
        fit: BoxFit.fill,
      ),
    );
  }
}
