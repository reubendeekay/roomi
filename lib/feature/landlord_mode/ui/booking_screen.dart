import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/common/constant/list_option.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';

import 'booking_received.dart';
import 'booking_sent.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  bool filter = false;
  TabController _tabController;
  int _activeTabIndex = 0;

  void _setActiveTabIndex() {
    setState(() {
      _activeTabIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: _activeTabIndex);
    _tabController.addListener(_setActiveTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: SavedWidget.createAppBarWidget(
          tabName: [
            ListOption.listBookReceived.isNotEmpty
                ? 'RECEIVED (${ListOption.listBookReceived.length})'
                : 'RECEIVED',
            ListOption.listBookSent.isNotEmpty
                ? 'SENT(${ListOption.listBookSent.length})'
                : 'SENT',
          ],
          tabController: _tabController,
          hasAction: false,
          height: height,
          title: 'Booking'),
      body: TabBarView(
        controller: _tabController,
        children: [
          BookingReceived(
            listBookReceived: ListOption.listBookReceived,
          ),
          BookingSent(
            listBookSent: ListOption.listBookSent,
          ),
        ],
      ),
    );
  }
}
