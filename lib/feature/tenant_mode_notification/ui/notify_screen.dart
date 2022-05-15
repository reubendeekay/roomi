import 'package:flutter/material.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/list_option.dart';

class NotifyScreen extends StatefulWidget {
  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return SizedBox(
      width: width,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.only(top: 24, left: 24),
            itemCount: ListOption.listNotify.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    ListOption.listNotify[index]['selected'] =
                        !ListOption.listNotify[index]['selected'];
                  });
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
                                  ListOption.listNotify[index]['avt'])),
                          Positioned(
                            top: 0,
                            left: -10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ListOption.listNotify[index]
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text:
                                          '${ListOption.listNotify[index]['name']} ',
                                      style: AppWidget.boldTextFieldStyle(
                                          height: 21,
                                          fontSize: 14,
                                          color: const Color(0xFF020433),
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              '${ListOption.listNotify[index]['title']}',
                                          style: AppWidget.simpleTextFieldStyle(
                                              height: 21,
                                              fontSize: 13,
                                              color: const Color(0xFF020433)),
                                        ),
                                        TextSpan(
                                          text:
                                              '${ListOption.listNotify[index]['action'] ? ' Chat with her now' : ''}',
                                          style: AppWidget.simpleTextFieldStyle(
                                              height: 15.85,
                                              fontSize: 13,
                                              color: const Color(0xFF0F73EE)),
                                        )
                                      ]),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 24),
                                child: Text(
                                    ListOption.listNotify[index]['time'],
                                    style: AppWidget.simpleTextFieldStyle(
                                        height: 15.85,
                                        fontSize: 13,
                                        color: const Color(0xFF95A0B6))),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
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
        ],
      ),
    );
  }
}
