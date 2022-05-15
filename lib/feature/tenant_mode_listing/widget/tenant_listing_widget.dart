import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_listing/widget/shimmer_widget.dart';

mixin TenantListingWidget {
  static Widget createAppBarWidget(
      {TabController tabController, double height, String title}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 203 * 12),
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          title,
          style: AppWidget.boldTextFieldStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF020433),
              height: 19.5),
        ),
      ),
    );
  }

  static Widget createListTile(
      {String imgAvt,
      String name,
      bool male,
      int age,
      String type,
      Widget trailing}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ListTile(
            leading: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(imgAvt,
                    height: 40, width: 40, fit: BoxFit.cover)),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: constraints.maxWidth / 2.5,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppWidget.boldTextFieldStyle(
                        color: const Color(0xFF020433),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 17.07),
                  ),
                ),
                Image.asset(
                  'images/tenant_mode/ic_verified@3x.png',
                  width: 16,
                  height: 16,
                  fit: BoxFit.cover,
                )
              ],
            ),
            subtitle: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Row(
                children: [
                  male != null
                      ? Image.asset(
                          male
                              ? 'images/tenant_mode/ic_male@3x.png'
                              : 'images/tenant_mode/ic_female@3x.png',
                          width: 16,
                          height: 16,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(),
                  age != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5, right: 8),
                          child: Text(
                            '$age',
                            style: AppWidget.simpleTextFieldStyle(
                                color: const Color(0xFF404B69),
                                fontSize: 13,
                                height: 15.85),
                          ),
                        )
                      : const SizedBox(),
                  age != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            '·',
                            style: AppWidget.boldTextFieldStyle(
                                color: const Color.fromRGBO(64, 75, 105, 0.5),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 21.94),
                          ),
                        )
                      : const SizedBox(),
                  Expanded(
                    child: Text(
                      type,
                      style: AppWidget.simpleTextFieldStyle(
                          color: const Color(0xFF404B69),
                          fontSize: 13,
                          height: 15.85),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget createListTileLoading() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: const ShimmerWidget(
                  radius: 20,
                  right: 16,
                  width: 40,
                  height: 40,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget(
                    bottom: 4,
                    width: constraints.maxWidth / 4,
                    height: 18,
                  ),
                  ShimmerWidget(
                    width: constraints.maxWidth / 2.5,
                    height: 16,
                  ),
                ],
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ShimmerWidget(
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget createSubTitle({String text, double top, double bottom}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: top ?? 0.0, bottom: bottom ?? 0.0),
        child: Text(
          text,
          style: AppWidget.boldTextFieldStyle(
              color: const Color(0xFF020433),
              height: 21.94,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
