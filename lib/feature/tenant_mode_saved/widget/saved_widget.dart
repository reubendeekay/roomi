import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class SavedWidget {
  static Widget createAppBarWidget(
      {TabController tabController,
      double height,
      bool hasAction,
      bool isScrollable,
      List<String> tabName,
      String title}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 203 * 24),
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.light,
        bottom: TabBar(
          controller: tabController,
          isScrollable: isScrollable ?? false,
          labelColor: const Color(0xFF0F73EE),
          labelStyle: AppWidget.boldTextFieldStyle(
              color: const Color(0xFF95A0B6),
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 15.85),
          indicatorColor: const Color(0xFF0F73EE),
          unselectedLabelColor: const Color(0xFF95A0B6),
          tabs: List.generate(
              tabName.length, (index) => Tab(text: tabName[index])),
        ),
        title: Text(
          title,
          style: AppWidget.boldTextFieldStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF020433),
              height: 19.5),
        ),
        actions: [
          hasAction
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Text(
                      'Post Room',
                      style: AppWidget.simpleTextFieldStyle(
                          fontSize: 14,
                          height: 17.07,
                          color: const Color(0xFF0F73EE)),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  static Widget createLine() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
    );
  }
}
