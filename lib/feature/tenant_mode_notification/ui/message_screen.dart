import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/route/routes.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({this.listMessNotify});
  final List<Map<String, dynamic>> listMessNotify;
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.only(top: 24, left: 24),
              itemCount: widget.listMessNotify.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.listMessNotify[index]['selected'] =
                          !widget.listMessNotify[index]['selected'];
                    });
                    Navigator.of(context).pushNamed(Routes.chatLandlordScreen);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                height: 32,
                                width: 32,
                                child: Image.asset(
                                    widget.listMessNotify[index]['avt'])),
                            Positioned(
                              top: 0,
                              left: -10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: widget.listMessNotify[index]
                                            ['selected']
                                        ? Colors.white
                                        : const Color(0xFF0F73EE),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 8,
                                width: 8,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget.listMessNotify[index]['name'],
                                          style: AppWidget.boldTextFieldStyle(
                                              height: 17.07,
                                              fontSize: 14,
                                              color: const Color(0xFF020433),
                                              fontWeight: FontWeight.w500)),
                                      Text(widget.listMessNotify[index]['time'],
                                          style: AppWidget.simpleTextFieldStyle(
                                              height: 15.85,
                                              fontSize: 13,
                                              color: const Color(0xFF95A0B6)))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 4),
                                    child: Text(
                                      widget.listMessNotify[index]['title'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppWidget.boldTextFieldStyle(
                                          height: 15.85,
                                          fontSize: 13,
                                          color: widget.listMessNotify[index]
                                                  ['selected']
                                              ? const Color(0xFF95A0B6)
                                              : const Color(0xFF020433),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(widget.listMessNotify[index]['mess'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppWidget.simpleTextFieldStyle(
                                          height: 15.85,
                                          fontSize: 13,
                                          color: widget.listMessNotify[index]
                                                  ['selected']
                                              ? const Color(0xFF95A0B6)
                                              : const Color(0xFF0F73EE))),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 16),
                              child: SavedWidget.createLine(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
