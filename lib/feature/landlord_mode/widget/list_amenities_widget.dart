import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class ListAmenitiesWidget extends StatefulWidget {
  const ListAmenitiesWidget({this.amenities});
  final List<String> amenities;
  @override
  _ListAmenitiesWidgetState createState() => _ListAmenitiesWidgetState();
}

class _ListAmenitiesWidgetState extends State<ListAmenitiesWidget> {
  bool showAll = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: showAll
          ? ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.amenities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Image.asset(
                    'images/tenant_mode/${widget.amenities[index]}',
                    height: 32,
                    width: 32,
                    color: const Color(0xFF020433),
                  ),
                );
              },
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.amenities.length >= 4
                      ? 4
                      : widget.amenities.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: index != 3 ? 24 : 0),
                      child: Image.asset(
                        'images/tenant_mode/${widget.amenities[index]}',
                        height: 32,
                        width: 32,
                        color: const Color(0xFF020433),
                      ),
                    );
                  },
                ),
                widget.amenities.length >= 4
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            showAll = !showAll;
                          });
                        },
                        child: Text(
                          '+ ${widget.amenities.length - 4}',
                          style: AppWidget.simpleTextFieldStyle(
                              color: const Color(0xFF0F73EE),
                              height: 24,
                              fontSize: 24),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
    );
  }
}
