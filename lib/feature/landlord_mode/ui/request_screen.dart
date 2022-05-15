import 'package:flutter/material.dart';
import 'package:roomy/app/widget_support.dart';
import 'package:roomy/feature/tenant_mode_notification/ui/notify_screen.dart';
import 'package:roomy/feature/tenant_mode_saved/widget/saved_widget.dart';

import 'request_chat_history.dart';
import 'request_pending.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen>
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
        TabController(length: 3, vsync: this, initialIndex: _activeTabIndex);
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
          tabName: ['PENDING', 'MESSAGE(2)', 'NOTIFICATIONS'],
          tabController: _tabController,
          hasAction: false,
          isScrollable: true,
          height: height,
          title: 'Chat Request'),
      body: TabBarView(
        controller: _tabController,
        children: [
          RequestPending(),
          RequestChatHistory(),
          NotifyScreen(),
        ],
      ),
    );
  }
}
