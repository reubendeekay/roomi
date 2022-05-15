import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';

class HandBookWidget {
  static Widget createAppBarWidget(
      {TabController tabController, double height, String title}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height / 203 * 24),
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        brightness: Brightness.light,
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: const Color(0xFF0F73EE),
          labelStyle: AppWidget.boldTextFieldStyle(
              color: const Color(0xFF95A0B6),
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 15.85),
          indicatorColor: const Color(0xFF0F73EE),
          unselectedLabelColor: const Color(0xFF95A0B6),
          tabs: const [
            Tab(text: 'LIFESTYLE'),
            Tab(text: 'ENTERTAINMENT'),
            Tab(text: 'HEALTHY'),
          ],
        ),
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
}
